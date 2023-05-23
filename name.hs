module Name where
import Lang 
import Parser

symbols :: [Definition] -> Bool
symbols [] = True
symbols def@(ConstDefinition _ _ expr@(EName _):xs) 
    | not $ exprExists expr def = False 
    | otherwise = symbols xs
symbols def@(FuncDefinition _ _ _ expr@(FuncApp _ _):xs) 
    | not $ exprExists expr def = False
    | otherwise = symbols xs
symbols (_:xs) = symbols xs

exprExists :: Expr -> [Definition] -> Bool
exprExists _ [] = False
exprExists e@(EName s) ((ConstDefinition _ name _):xs)
    | s == name = True
    | otherwise = exprExists e xs
exprExists e@(FuncApp s _) ((FuncDefinition _ name _ _):xs) 
    | s == name = True
    | otherwise = exprExists e xs