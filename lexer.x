-- Auteurs : Dorian Gillioz & Oscar Baume
-- Analyseur lexiacal de notre langage :
-- Permet l'analyse lexicale des termes de notre langage fonctionnel

{
module Lexer where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]

tokens :-

    -- Caractère blanc et de commentaire
    $white+                           ;
    "//".*                            ;

    -- Expressions littérales
    $digit+                           { \s -> Int (read s) }
    "true"                            { \_ -> Bool True }
    "false"                           { \_ -> Bool False }

    -- Instructions
    let                               { \_ -> Let }
    in                                { \_ -> In }
    case                              { \_ -> Case }
    of                                { \_ -> Of }
    int | bool                        { \s -> Type s}
    "if"                              { \_ -> If }
    "else"                            { \_ -> Else }

    -- Opérateurs
    "->"                              { \_ -> Arrow }
    "="                               { \_ -> Affect }
    "_"                               { \_ -> Wildcard }

    -- Arithmétiques
    "+"                               { \_ -> Plus }
    "-"                               { \_ -> Minus }
    "*"                               { \_ -> Star }
    "/"                               { \_ -> Slash }
    "%"                               { \_ -> Mod }

    -- Comparaisons
    "=="                              { \_ -> Equals }
    "!="                              { \_ -> NotEquals }
    "<"                               { \_ -> Less }
    "<="                              { \_ -> LessEquals }
    ">"                               { \_ -> More }
    ">="                              { \_ -> MoreEquals }

    -- Logiques
    "!"                               { \_ -> Not }
    "&&"                              { \_ -> And }
    "||"                              { \_ -> Or }

    -- Séparateurs
    "("                               { \_ -> LPar }
    ")"                               { \_ -> RPar }
    ","                               { \_ -> Comma }
    ";"                               { \_ -> Semicolon }

    -- Nom de variable
    $alpha [$alpha $digit \_ \']*     { \s -> Name s }

{

data Token
  = Let
  | Type String
  | In
  | Case
  | Of
  | If
  | Else
  | Arrow
  | Int Int
  | Bool Bool
  | Name String
  | Affect
  | Wildcard
  | Plus
  | Minus
  | Star
  | Slash
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
  | Semicolon
  deriving (Eq, Show)
  
lexer = alexScanTokens
}