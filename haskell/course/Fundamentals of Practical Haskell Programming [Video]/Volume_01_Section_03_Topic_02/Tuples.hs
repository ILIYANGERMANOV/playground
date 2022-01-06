------------------------------------------------------------
--
-- Tuples.hs
-- Code sample accompanying topic 1.3.2 "Types and type signatures"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

t0 :: (Int, Int)
t0 = (1234, 5678)

t1 :: (String, Int, Double)
t1 = ("sometext", 8, 3.141)

t2 :: ([Int], [String], (Float, Char))
t2 = ([1, 2, 3, 4], ["aaa", "bbb"], (1.0, 'o'))

main :: IO ()
main = do
    print t0
    print t1
    print t2
