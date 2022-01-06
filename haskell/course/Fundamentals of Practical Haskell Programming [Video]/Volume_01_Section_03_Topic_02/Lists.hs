------------------------------------------------------------
--
-- Lists.hs
-- Code sample accompanying topic 1.3.2 "Types and type signatures"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

l0 :: [Int]
l0 = [1, 2, 3, 4, 5]

l1 :: [Int]
l1 = [1..10]

l2 :: [Int]
l2 = [1, 3..10]

l3 :: [Int]
l3 = [1..]

l4 :: [String]
l4 = ["aaa", "bbb", "ccc", "ddd"]

l5 :: [Char]
l5 = ['a', 'b', 'c', 'd']

l6 :: [Char]
l6 = "abcd"

main :: IO ()
main = do
    print l0
    print l1
    print l2
    print (take 20 l3)
    print l4
    print l5
    print l6
