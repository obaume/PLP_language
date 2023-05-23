module Type where
import Lang
import Parser

analysis :: [Definition] -> Bool
analysis [] = True
analysis (ConstDefinition TInt _ (Value (IntValue _)):xs) = analysis xs
analysis (ConstDefinition TInt _ (Value (NegIntValue _)):xs) = analysis xs
analysis (ConstDefinition TBool _ (Value (BoolValue _)):xs) = analysis xs
analysis (ConstDefinition (TTuple types) _ (Value (TupleValue values)):xs) 
    | analyzeTuple types values = analysis xs
    | otherwise = False
analysis _ = False

-- Analyse de la déclaration d'un tuple
analyzeTuple :: [Type] -> [Expr] -> Bool
analyzeTuple [] [] = True
analyzeTuple _ [] = False
analyzeTuple [] _ = False
analyzeTuple (TInt:types) (Value (IntValue _):val) = analyzeTuple types val
analyzeTuple (TInt:types) (Value (NegIntValue _):val) = analyzeTuple types val
analyzeTuple (TBool:types) (Value (BoolValue _):val) = analyzeTuple types val
analyzeTuple ((TTuple t):types) (Value (TupleValue v):val)
    | analyzeTuple t v = analyzeTuple types val
    | otherwise = False
analyzeTuple _ _ = False