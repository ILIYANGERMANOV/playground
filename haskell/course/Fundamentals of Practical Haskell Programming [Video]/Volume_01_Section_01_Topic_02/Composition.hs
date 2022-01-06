------------------------------------------------------------
--
-- Composition.hs
-- Code sample accompanying topic 1.1.2 "The FP Way"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

f x = x + 10

g x = x * x

main = print $ map (g . f) [1, 2, 3]
