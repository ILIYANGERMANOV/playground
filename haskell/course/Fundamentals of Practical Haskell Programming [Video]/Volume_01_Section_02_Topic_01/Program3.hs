------------------------------------------------------------
--
-- Program3.hs
-- Code sample accompanying topic 1.2.1 "Our first Haskell programs"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

main :: IO ()
main = do
    content <- readFile "numbers.txt"
    print content
