------------------------------------------------------------
--
-- Strings.hs
-- Code sample accompanying topic 1.3.2 "Types and type signatures"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

s0 :: String
s0 = "abc"

s1 :: String
s1 = "\0088\x0058\o0130"

main :: IO ()
main = do
    putStrLn s0
    putStrLn s1
