-- Auteurs : Dorian Gillioz & Oscar Baume
-- Architecture des types et tokens de notre langaage

module Lang where
    type Name = String
    type TEnv = [(Name, Type)]
    type Env = [(Name,Value)]

    data Statement
        = Def Definition
        | Expr Expr 
        deriving (Show)

    data Definition
        = ConstDefinition Type Name Expr
        | FuncDefinition Type Name [Param] Expr
        deriving (Show)
        
    data Param
        = Param Type Name
        deriving (Show)

    data Expr 
        = FuncApp Name [Expr]
        | IfElse Expr Expr Expr
        | Let [Definition] Expr
        | EName Name
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
