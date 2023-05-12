{
module Lexer (lexer, Token(..)) where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]

tokens :-

    $white+                           ;
    "//".*                            ;
    let                               { \s -> Let }
    in                                { \s -> In }
    case                              { \s Case }
    of                                { \s Of }
    $digit+                           { \s -> Int (read s) }
    "True"                            { \s -> Bool True }
    "False"                           { \s -> Bool False }
    "="                               { \s Affect }
    "_"                               { \s Wildcard }
    "+"                               { \s Plus }
    "-"                               { \s Minus }
    "*"                               { \s Star }
    "/"                               { \s Slash }
    "++"                              { \s PlusPlus }
    "--"                              { \s MinusMinus }
    "%"                               { \s Mod }
    "=="                              { \s Equals }
    "!="                              { \s NotEquals }
    "!"                               { \s Not }
    "<"                               { \s Less }
    "<="                              { \s LessEquals }
    ">"                               { \s More }
    ">="                              { \s MoreEquals }
    "&&"                              { \s And }
    "||"                              { \s Or }
    "("                               { \s LPar }
    ")"                               { \s RPar }
    ","                               { \s Comma }
    $alpha [$alpha $digit \_ \']*     { \s -> Var s }

{

data Token
  = Let
  | In
  | Case
  | Of
  | Var String
  | Int Int
  | Bool Bool
  | Affect
  | Wildcard
  | Plus
  | Minus
  | Star
  | Slash
  | PlusPlus
  | MinusMinus
  | Mod
  | Equals
  | NotEquals
  | Not
  | Less
  | LessEquals
  | More
  | MoreEquals
  | And
  | Or
  | LPar
  | RPar
  | Comma
  deriving (Eq, Show)
  
lexer = alexScanTokens
}