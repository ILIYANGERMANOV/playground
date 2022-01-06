------------------------------------------------------------
--
-- Constraints2.hs
-- Code sample accompanying topic 1.3.2 "Types and type signatures"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

myFold :: (a -> b -> b) -> b -> [a] -> b
myFold _ b [] = b
myFold f b (a : as) = myFold f (f a b) as

mySum = myFold (+) 0

main :: IO ()
main = print $ mySum [10, 20, 30]
