------------------------------------------------------------
--
-- Polymorphism.hs
-- Code sample accompanying topic 1.3.2 "Types and type signatures"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

myMap :: (a -> b) -> [a] -> [b]
myMap _ [] = []
myMap f (a : as) = f a : myMap f as

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ [] = []
myFilter f (a : as) = if f a then a : myFilter f as else myFilter f as

myFold :: (a -> b -> b) -> b -> [a] -> b
myFold _ b [] = b
myFold f b (a : as) = myFold f (f a b) as

main :: IO ()
main = do
    print $ myMap show [10, 20, 30]
    print $ myFilter (< 25) [10, 20, 30]
    print $ myFold (+) 100 [10, 20, 30]
