module lang where
    type Name = String
    type TEnv = [(Name,Type)]
    type Env = [(Name,Value)]

    data Statement
        = Def Definition
        | Expr Expr 
        deriving(Show)

    data Expr 
        = App String [Expr]
        | Let [Definition] Expr
        | EVar String
        | Value Value
        | CaseOf Expr [(Pattern,Expr)]
        | UnaryOp Operator Expr
        | BinaryOp Operator Expr Expr 
        deriving(Show)

    data Operator
        = Operator OperatorType String
        deriving(Show)

    data OperatorType
        = Arithmetic
        | Comparaison
        | Relational
        | Logical
        deriving(Show)

    data Pattern 
        = PVar String
        | PValue Value
        | PWildcard
        deriving(Show)

    data Definition
        = Definition String [Arg] Expr
        deriving (Show)

    data Arg
        = Arg Type String
        deriving (Show)

    data Value
        = BoolValue Bool
        | IntValue Int
        | TupleValue Expr Expr
        | FuncValue Expr [Arg] Env
        deriving (Show)

    data Type 
        = TBool
        | TInt
        | TTuple Type Type 
        | TFunc Type [Type]
        | TWildcard
        deriving (Show,Eq)