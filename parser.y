-- Auteurs : Dorian Gillioz & Oscar Baume
-- Parser de notre langage :
-- Permet l'analyse synthaxique de notre langage fonctionnel

{
module Parser (parser) where
import Lexer
import Lang
}

%name parser
%tokentype { Token }
%error { parseError }

%token
    let     { Lexer.Let }
    in      { Lexer.In }
    case    { Lexer.Case }
    of      { Lexer.Of }
    int     { Lexer.Int $$ }
    bool    { Lexer.Bool $$ }
    "if"    { Lexer.If }
    "else"  { Lexer.Else }
    "->"    { Lexer.Arrow }
    '='     { Lexer.Affect }
    '_'     { Lexer.Wildcard }
    '+'     { Lexer.Plus }
    '-'     { Lexer.Minus }
    '*'     { Lexer.Star }
    '/'     { Lexer.Slash }
    '++'    { Lexer.PlusPlus }
    '--'    { Lexer.MinusMinus }
    '%'     { Lexer.Mod }
    '=='    { Lexer.Equals }
    '!='    { Lexer.NotEquals }
    '!'     { Lexer.Not }
    '<'     { Lexer.Less }
    '<='    { Lexer.LessEquals }
    '>'     { Lexer.More }
    '>='    { Lexer.MoreEquals }
    '&&'    { Lexer.And }
    '||'    { Lexer.Or }
    '('     { Lexer.LPar }
    ')'     { Lexer.RPar }
    ','     { Lexer.Comma }

%%

-- Instructions
---------------
Stmt    : Def                                   { Lang.Def $1 }
        | Expr                                  { Lang.Expr $1}

-- Définitions
--------------
Def     : Type 'name' '=' Expr                  { Lang.Definition $2 [] $4 }
        | FuncDef                               { $1 }

FuncDef : Type 'name' '(' Params ')' Expr       { Lang.Definition $2 $4 $6 }
        | Type 'name' '(' ')' Expr              { Lang.Definition $2 [] $6 }

Params  : Param                                 { [$1] }
        | Param ',' Params                      { $1:$3}

Param   : Type 'name'                           { Param $1 $2 }

-- Expressions
--------------
Expr    : Value                                 { Lang.Value $1 }
        | FuncApp                               { $1 }
        | Cond                                  { $1 }
        | let Def in Exp                        { Lang.Let $2 $4 $6 }
        | 'case' Expr 'of' CasePatterns         { Lang.CaseOf $2 $4 }
        | UnaryOp Expr                          { Lang.UnaryOp $1 $2 }
        | Expr BinaryOp Expr                    { Lang.BinaryOp $1 $2 $3 }

-- Valeurs
Value   : 'int'                                 { Lang.IntValue $1}
        | 'bool'                                { Lang.BoolValue $1 }
        | Tuple                                 { $1 }

Tuple   : '('')'                                { Lang.TupleValue _ _ }
        | '(' Expr ',' Expr ')'                 { Lang.TupleValue $2 $4} 

-- Applications de fonctions
FuncApp : 'name' '(' Args ')'                   { Lang.App $1 $3}
        | 'name' '(' ')'                        { FuncApp $1 []}

Args    : Expr                                  { [$1] }
        | Expr ',' Args                         { $1:$3 }

-- Expressions conditionnelles parenthésées
Cond    : 'if' '(' Expr ')' Stmt                { If $3 $5 }
        | 'if' '(' Expr ')' Stmt 'else' Stmt    { IfElse $3 $5 $7 }

Type    : int                                   { Int }
        | bool                                  { Bool }

-- Patternes
CasePatterns : CasePattern                      { [$1] }
             | CasePattern CasePatterns         { $1:$2 }

CasePattern  : Pattern '->' Expr                { ($1, $3) }

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
         | '<'                                  { Lang.Operator Lang.Relational "<"}
         | '<='                                 { Lang.Operator Lang.Relational "<="}
         | '>'                                  { Lang.Operator Lang.Relational ">"}
         | '>='                                 { Lang.Operator Lang.Relational ">="}

{
parseError :: [Token] -> a
parseError x = error ("Parse error: " ++ show x)
}