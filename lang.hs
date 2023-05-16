-- Auteurs : Dorian Gillioz & Oscar Baume
-- Architecture des types et tokens de notre langaage

module Lang where
    type Name = String
    type Env = [(Name,Value)]

    data Statement
        = Def Definition
        | Expr Expr 
        deriving (Show)

    data Definition
        = ConstDefinition Type String Expr
        | FuncDefinition Type String [Param] [Statement]
        deriving (Show)
        
    data Param
        = Param Type String
        deriving (Show)

    data Expr 
        = FuncApp String [Expr]
        | Parenthesis Expr
        | If Expr Statement
        | IfElse Expr Statement Statement
        | Let [Definition] Expr
        | EName String
        | Value Value
        | CaseOf Expr [CasePattern]
        | UnaryOp Operator Expr
        | BinaryOp Expr Operator Expr 
        deriving (Show)

    data Operator
        = Operator OperatorType String
        deriving (Show)

    data OperatorType
        = Arithmetic
        | Comparaison
        | Logical
        deriving (Show)

    data CasePattern
        = CasePattern Pattern Expr
        deriving (Show)

    data Pattern 
        = PValue Value
        | PVar String
        | PWildcard
        deriving (Show)

    data Value
        = BoolValue Bool
        | IntValue Int
        | TupleValue [Expr]
        | FuncValue Expr [Param] Env
        deriving (Show)
        
    data Type 
        = TBool
        | TInt
        | TTuple [Type]
        | TFunc Type [Type]
        | TWildcard
        deriving (Show,Eq)