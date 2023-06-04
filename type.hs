module Type (typeof) where
    import Data.List (find)
    import Lang 
    import Lexer
    import Parser
    import Name
    -- Environments
    getType :: Name -> TEnv -> Type 
    getType name env = case lookup name env of
        Just t -> t  
        Nothing -> error $ name ++ " not found"

    addToEnv :: Definition -> TEnv -> TEnv
    addToEnv (ConstDefinition t name expr) env = 
        if t == t' 
            then (name, t') : env 
            else error "type de l'expression différent du type de la variable"
        where
            t' = typeofExpr expr env
    addToEnv (FuncDefinition t name params expr) env = 
        if t == t' 
            then (name, TFunc t' params') : env
            else error "type de retour différent du type de fonction"
        where
            env' = foldl (\env (Param t name) -> (name, t) : env) env params
            params' = map (\(Param t name) -> t) params
            t' = typeofExpr expr env'

    addToEnv' :: TEnv -> Definition -> TEnv    
    addToEnv' env def = addToEnv def env

    -- fonction principale du module, elle prends la sortie de la fonction checkName pour son premier parametre et un envirion de type vide  
    checkType :: [Definition] -> TEnv -> TEnv
    checkType defs env = reverse $ foldl addToEnv' env (reverse defs)

    typeof :: Statement -> TEnv -> (TEnv, Type)
    typeof (Expr e) env = ([],typeofExpr e env)
    typeof (Def d) env = typeofDef d env

    typeofTuple :: [Expr] -> TEnv -> [Type]
    typeofTuple [] _ = []
    typeofTuple (x:xs) env = (typeofExpr x env): typeofTuple xs env

    typeofExpr :: Expr -> TEnv -> Type
    typeofExpr (FuncApp name param) env = typeofFuncApp name param env
    typeofExpr (IfElse cond t e) env = typeofIfElse cond t e env
    typeofExpr (Lang.Let defs e) env = typeofLet defs e env
    typeofExpr (EName name) env = getType name env  
    typeofExpr (Value value) env = typeofValue value env
    typeofExpr (CaseOf expr patterns) env = typeofCaseOf expr patterns env 
    typeofExpr (UnaryOp op expr1) env = typeofUnaryOp op expr1 env
    typeofExpr (BinaryOp expr1 op expr2) env = typeofBinaryOp op expr1 expr2 env

    typeofIfElse :: Expr -> Expr -> Expr -> TEnv -> Type 
    typeofIfElse cond t e env = 
        case typeofExpr cond env of
            TBool -> 
                if t' == e' 
                    then t' 
                    else error "Erreur : les branches then et else ne retourne pas le meme type"
                where
                    t' = typeofExpr t env 
                    e' = typeofExpr e env
            _ -> error "Erreur : condition non booleen"

    typeofValue :: Value -> TEnv -> Type
    typeofValue (BoolValue _) env = TBool
    typeofValue (IntValue _) env = TInt
    typeofValue (TupleValue xs) env = TTuple (typeofTuple xs env)
    typeofValue (FuncValue expr params local) global = TFunc (typeofExpr expr global) params'
        where
            params' = map (\(Param t name) -> t) params

    typeofBinaryOp :: Operator -> Expr -> Expr -> TEnv -> Type
    typeofBinaryOp (Operator Arithmetic _) x y env =
        case (typeofExpr x env , typeofExpr y env) of
            (TInt, TInt) -> TInt
            _ -> error "Erreur : Operation arithmetic invalide"
    typeofBinaryOp (Operator Comparaison _) x y env =
        case (typeofExpr x env , typeofExpr y env) of
            (TInt, TInt) -> TBool
            _ -> error "Erreur : Operation de comparaison invalide"
    typeofBinaryOp (Operator Logical _) x y env =
        case (typeofExpr x env , typeofExpr y env) of
            (TBool, TBool) -> TBool
            _ -> error "Erreur : Operation logique invalide"
    
    typeofUnaryOp :: Operator -> Expr -> TEnv -> Type
    typeofUnaryOp (Operator Arithmetic _) x env =
        case typeofExpr x env of
            TInt -> TInt
            _ -> error "Erreur : Operation arithmetic invalide"
    typeofUnaryOp (Operator Logical _) x env = 
        case typeofExpr x env of
            TBool -> TBool
    typeofUnaryOp _ _ _ = error "Erreur : Operation unaire invalide"

    typeofLet :: [Definition] -> Expr -> TEnv -> Type
    typeofLet defs expr env = typeofExpr expr env'
        where 
            env' = checkType defs env
    
    typeofCaseOf :: Expr -> [CasePattern] -> TEnv -> Type
    typeofCaseOf condition cases env =
        if any (\(p,e) -> (p /= tcond && p /= TWildcard) || e /= texpr) tcases
            then error "Erreur : Operation case invalide"
            else texpr
        where 
            tcond = typeofExpr condition env
            tcases = map (\(CasePattern p e) -> (typeofPattern p env, typeofExpr e env)) cases
            texpr = snd $ head tcases
    
    typeofPattern :: Pattern -> TEnv -> Type
    typeofPattern (PVar x) env = getType x env
    typeofPattern (PValue x) env = typeofValue x env
    typeofPattern PWildcard env = TWildcard

    typeofFuncApp :: Name -> [Expr] -> TEnv -> Type
    typeofFuncApp name param env =
        case lookup name env of
            Just(TFunc t param') ->
                if(all(\(t,a) -> t == typeofExpr a env) (zip param' param))
                    then t
                    else error "Erreur : parametre de fonction invalide"
            _ -> error $ "Erreur : Appel à la fonction inconnu " ++ name

    typeofDef :: Definition -> TEnv -> (TEnv,Type)
    typeofDef def@(ConstDefinition t name expr) env  = (env', getType name env')
        where 
            env' = addToEnv def env
    typeofDef def@(FuncDefinition t name param expr) env = (env', getType name env')    
        where 
            env' = addToEnv def env