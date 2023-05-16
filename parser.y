-- Auteurs : Dorian Gillioz & Oscar Baume
-- Parser de notre langage :
-- Permet l'analyse synthaxique de notre langage fonctionnel

{
module Parser where
import Lexer
import qualified Lang
}

%name parser
%tokentype { Token }
%error { parseError }

%token
    let     { Let }             -- Let pour la déclaration locale
    in      { In }             
    case    { Case }
    of      { Of }
    int     { Type "int" }      -- Nom du type entier
    bool    { Type "bool" }     -- Nom du type booléen
    'int'   { Int $$ }          -- Valeur du type entier
    'bool'  { Bool $$ }         -- Valeur du type booléen
    'if'    { If }
    'else'  { Else }
    'name'  { Name $$ }         -- Nom d'une référence (constante, fonction)
    '->'    { Arrow }           -- Flèche utilisée dans le case
    '='     { Affect }
    '_'     { Wildcard }        -- Valeur anecdotique
    '+'     { Plus }
    '-'     { Minus }
    '*'     { Star }
    '/'     { Slash }
    '++'    { PlusPlus }
    '--'    { MinusMinus }
    '%'     { Mod }
    '=='    { Equals }
    '!='    { NotEquals }
    '!'     { Not }
    '<'     { Less }
    '<='    { LessEquals }
    '>'     { More }
    '>='    { MoreEquals }
    '&&'    { And }
    '||'    { Or }
    '('     { LPar }
    ')'     { RPar }
    ','     { Comma }

%right in
%right '||'
%right '&&'
%nonassoc '==' '!=' '<' '<=' '>' '>='
%left '+' '-'
%left '*' '/'
%left '-' '!' '++' '--'

%%

-- Instructions
---------------
Stmts   : Stmt                                  { [$1] }
        | Stmt Stmts                            { $1:$2 }

Stmt    : Def                                   { Lang.Def $1 }
        | Expr                                  { Lang.Expr $1}

-- Définitions
--------------
Defs    : Def                                   { [$1] }
        | Def Defs                              { $1:$2 }

Def     : Type 'name' '=' Expr                  { Lang.ConstDefinition $1 $2 $4 }
        | FuncDef                               { $1 }

FuncDef : Type 'name' '(' Params ')' Stmts      { Lang.FuncDefinition $1 $2 $4 $6 }
        | Type 'name' '(' ')' Stmts             { Lang.FuncDefinition $1 $2 [] $5 }

Params  : Param                                 { [$1] }
        | Param ',' Params                      { $1:$3 }

Param   : Type 'name'                           { Lang.Param $1 $2 }

-- Expressions
--------------
Expr    : Value                                 { Lang.Value $1 }
        | FuncApp                               { $1 }
        | Cond                                  { $1 }
        | '(' Expr ')'                          { Lang.Parenthesis $2 }
        | 'name'                                { Lang.EName $1 }
        | let Defs in Expr                      { Lang.Let $2 $4 }
        | case Expr of CasePatterns             { Lang.CaseOf $2 $4 }
        | UnaryOp Expr                          { Lang.UnaryOp $1 $2 }
        | Expr BinaryOp Expr                    { Lang.BinaryOp $1 $2 $3 }

-- Valeurs
Value   : 'int'                                 { Lang.IntValue $1}
        | 'bool'                                { Lang.BoolValue $1 }
        | Tuple                                 { $1 }

Tuple   : '(' ')'                               { Lang.TupleValue [] }
        | '(' Elements ')'                      { Lang.TupleValue $2 }

Elements : Expr ',' Expr                        { [$1] ++ [$3] }
         | Expr ',' Elements                    { $1:$3 }

-- Applications de fonctions
FuncApp : 'name' '(' ')'                        { Lang.FuncApp $1 []}
        | 'name' '(' Args ')'                   { Lang.FuncApp $1 $3}

Args    : Expr                                  { [$1] }
        | Expr ',' Args                         { $1:$3 }

-- Expressions conditionnelles
Cond    : 'if' '(' Expr ')' Stmt                { Lang.If $3 $5 }
        | 'if' '(' Expr ')' Stmt 'else' Stmt    { Lang.IfElse $3 $5 $7 }

-- Patternes
CasePatterns : CasePattern                      { [$1] }
             | CasePattern CasePatterns         { $1:$2 }

CasePattern  : Pattern '->' Expr                { Lang.CasePattern $1 $3 }

Pattern : Value                                 { Lang.PValue $1 }
        | 'name'                                { Lang.PVar $1 }
        | '_'                                   { Lang.PWildcard }

-- Opérateurs Unaires
UnaryOp : '-'                                   { Lang.Operator Lang.Arithmetic "-" }
        | '++'                                  { Lang.Operator Lang.Arithmetic "++"}
        | '--'                                  { Lang.Operator Lang.Arithmetic "--"}
        | '!'                                   { Lang.Operator Lang.Logical "!" }

-- Opérateurs Binaires
BinaryOp : '+'                                  { Lang.Operator Lang.Arithmetic "+"}
         | '-'                                  { Lang.Operator Lang.Arithmetic "-"}
         | '*'                                  { Lang.Operator Lang.Arithmetic "*"}
         | '/'                                  { Lang.Operator Lang.Arithmetic "/"}
         | '%'                                  { Lang.Operator Lang.Arithmetic "%"}
         | '&&'                                 { Lang.Operator Lang.Logical "&&"}
         | '||'                                 { Lang.Operator Lang.Logical "||"}
         | '=='                                 { Lang.Operator Lang.Comparaison "=="}
         | '!='                                 { Lang.Operator Lang.Comparaison "!="}
         | '<'                                  { Lang.Operator Lang.Comparaison "<"}
         | '<='                                 { Lang.Operator Lang.Comparaison "<="}
         | '>'                                  { Lang.Operator Lang.Comparaison ">"}
         | '>='                                 { Lang.Operator Lang.Comparaison ">="}

-- Types
Type    : int                                   { Lang.TInt }
        | bool                                  { Lang.TBool }

{
parseError :: [Token] -> a
parseError x = error ("Parse error: " ++ show x)
}