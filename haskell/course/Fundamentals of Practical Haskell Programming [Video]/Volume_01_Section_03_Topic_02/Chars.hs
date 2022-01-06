------------------------------------------------------------
--
-- Chars.hs
-- Code sample accompanying topic 1.3.2 "Types and type signatures"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

c0 :: Char
c0 = 'X'

c1 :: Char
c1 = '\0088'

c2 :: Char
c2 = '\x0058'

c3 :: Char
c3 = '\o0130'

main :: IO ()
main = do
    putChar c0 >> putChar '\n'
    putChar c1 >> putChar '\n'
    putChar c2 >> putChar '\n'
    putChar c3 >> putChar '\n'
