rm *.o
rm *.hi
rm lexer.hs
rm parser.hs

alex lexer.x
happy parser.y

ghc parser.hs