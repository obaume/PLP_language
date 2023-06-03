module Name where
    import Data.List (find)
    import Lang 
    import Lexer
    import Parser

     -- pour une définition on doit vérifier si le nom est disponible 

    -- pour une expression qui fait un appel a une fonction ou une variable il faut vérifier si ils existent
    
    nameExist :: Name -> [Definition] -> Bool
    nameExist name env = case lookupDef name env of
        Just _ -> True
        Nothing -> False
    
    checkDefinition :: Definition -> [Definition] -> [Definition]
    checkDefinition def@(ConstDefinition t name expr) env = 
        if not (nameExist name env)
            then checkExpr expr (def : env)
            else error $ "la variable " ++ name ++ " existe déjà"
    checkDefinition def@(FuncDefinition t name params expr) env = 
        if not (nameExist name env)
            then checkExpr expr (def : env)
            else error $ "La fonction " ++ name ++ " existe déjà"
                where 
                    params' = replicate (length params) TWildcard 
    checkDefinition' :: [Definition] -> Definition -> [Definition]
    checkDefinition' env def = checkDefinition def env

    checkDefinitions :: [Definition] -> [Definition] -> [Definition]
    checkDefinitions defs previousDefs = foldl checkDefinition' previousDefs defs
    
    checkExpr :: Expr -> [Definition] -> [Definition]
    checkExpr (FuncApp name params) env = 
        if nameExist name env
            then checkParam name params env
            else error $ "La fonction " ++ name ++ " n'existe pas"
    checkExpr (IfElse cond t e) env = checkExprs (cond:t:[e]) env 
    checkExpr (Lang.Let defs expr) env = checkExpr expr (checkDefinitions defs [])
    checkExpr (EName name) env =
        if nameExist name env 
            then env
            else error $ "La variable " ++ name ++ " n'existe pas"
    checkExpr (Value v) env = env
    checkExpr (CaseOf expr patterns) env = checkExprs (expr:p') env 
        where 
            p' = map (\(CasePattern p e) -> e) patterns
    checkExpr (UnaryOp op x) env = checkExpr x env
    checkExpr (BinaryOp x op y) env = checkExprs (x:[y]) env

    checkExprs :: [Expr] -> [Definition] -> [Definition]
    checkExprs [] env = env
    checkExprs (x:xs) env = foldl (flip checkExpr) env xs 

    checkParam :: Name -> [Expr] -> [Definition] -> [Definition]
    checkParam name params env =
        case lookupDef name env of
            Just (FuncDefinition _ _ p _) -> if length p == length params 
                then env  
                else error $ "Nombre incorrect de paramètre pour la fonction " ++ name

    lookupDef :: Name -> [Definition] -> Maybe Definition
    lookupDef _ [] = Nothing
    lookupDef name (d@(ConstDefinition t name' expr):defs) =
        if name == name' then Just d else lookupDef name defs
    lookupDef name (d@(FuncDefinition _ name' _ _):defs) = 
        if name == name' then Just d else lookupDef name defs