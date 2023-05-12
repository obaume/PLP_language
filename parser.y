{
module Parser (parser) where
import Lexer
}

%name parser
%tokentype { Token }
%error { parseError }

%token
    let     { Lexer.Let }
    in      { Lexer.In }
    case    { Lexer.Case }
    of      { Lexer.Of }
    var     { Lexer.Var $$ }
    int     { Lexer.Int $$ }
    bool    { Lexer.Bool $$ }
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