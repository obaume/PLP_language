-- Auteurs : Dorian Gillioz & Oscar Baume
-- Analyseur lexiacal de notre langage :
-- Permet l'analyse lexicale des termes de notre langage fonctionnel

{
module Lexer (lexer, Token(..)) where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]

tokens :-

    $white+                           ;
    "//".*                            ;
    let                               { \_ -> Let }
    in                                { \_ -> In }
    case                              { \_ -> Case }
    of                                { \_ -> Of }
    "if"                              { \_ -> If }
    "else"                            { \_ -> Else }
    "->"                              { \_ -> Arrow }
    $digit+                           { \s -> Int (read s) }
    "true"                            { \_ -> Bool True }
    "false"                           { \_ -> Bool False }
    "="                               { \_ -> Affect }
    "_"                               { \_ -> Wildcard }
    "+"                               { \_ -> Plus }
    "-"                               { \_ -> Minus }
    "*"                               { \_ -> Star }
    "/"                               { \_ -> Slash }
    "++"                              { \_ -> PlusPlus }
    "--"                              { \_ -> MinusMinus }
    "%"                               { \_ -> Mod }
    "=="                              { \_ -> Equals }
    "!="                              { \_ -> NotEquals }
    "!"                               { \_ -> Not }
    "<"                               { \_ -> Less }
    "<="                              { \_ -> LessEquals }
    ">"                               { \_ -> More }
    ">="                              { \_ -> MoreEquals }
    "&&"                              { \_ -> And }
    "||"                              { \_ -> Or }
    "("                               { \_ -> LPar }
    ")"                               { \_ -> RPar }
    ","                               { \_ -> Comma }
    $alpha [$alpha $digit \_ \']*     { \s -> Var s }

{

data Token
  = Let
  | In
  | Case
  | Of
  | If
  | Else
  | Arrow
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