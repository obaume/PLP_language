module Name (typeof) where
    import Data.List (find)
    import Lang 
    import Lexer
    import Parser
    

    -- Environments
    getType :: Name -> TEnv -> Type 
    getType name env = case lookup name env of
        Just t -> t  
        Nothing -> error $ name ++ " not found"

    addToEnv :: Definition -> TEnv -> TEnv
    addToEnv (ConstDefinition t name expr) env = (name, typeofExpr expr env) : env
    addToEnv (FuncDefinition t name params expr) env = (name, TFunc (typeofExpr expr env') params') : env
        where
            env' = foldl (\env (Param t name) -> (name, t) : env) env params
            params' = map (\(Param t name) -> t) params

    addDefinitionsToEnv :: [Definition] -> TEnv -> TEnv
    addDefinitionsToEnv defs env = foldr addToEnv env defs

    typeof :: Statement -> TEnv -> (TEnv, Type)
    typeof (Expr e) env = ([],typeofExpr e env)
    typeof (Def d) env = typeofDef d env

    typeofTuple :: [Expr] -> TEnv -> [Type]
    typeofTuple [] _ = []
    typeofTuple (x:xs) env = (typeofExpr x env): typeofTuple xs env


    typeofExpr :: Expr -> TEnv -> Type
    typeofExpr (FuncApp name param) env = typeofFuncApp name param env
    --typeofExpr IfElse 
    typeofExpr (Lang.Let defs e) env = typeofLet defs e env
    typeofExpr (EName name) env = getType name env  
    typeofExpr (Value value) env = typeofValue value env
    typeofExpr (CaseOf expr patterns) env = typeofCaseOf expr patterns env 
    typeofExpr (UnaryOp op expr1) env = typeofUnaryOp op expr1 env
    typeofExpr (BinaryOp expr1 op expr2) env = typeofBinaryOp op expr1 expr2 env

    typeofValue :: Value -> TEnv -> Type
    typeofValue (BoolValue _) env = TBool
    typeofValue (IntValue _) env = TInt
    typeofValue (TupleValue xs) env = TTuple (typeofTuple xs env)
    typeofValue (FuncValue expr params local) global = TFunc (typeofExpr expr global) params'
        where
            params' = map (\(Param t name) -> t) params
    typeofValue _ _ = error "Valeur inconnu"

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
            env' = addDefinitionsToEnv defs env
    
    typeofCaseOf :: Expr -> [CasePattern] -> TEnv -> Type
    typeofCaseOf condition cases env =
        if any (\(p,e) ->(p /= tcond && p /= TWildcard) || e /= texpr) tcases
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
                if(length param == length param' && all(\(t,a) -> t == typeofExpr a env) (zip param' param))
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
