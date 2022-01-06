------------------------------------------------------------
--
-- Filter.hs
-- Code sample accompanying topic 1.1.2 "The FP Way"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

main = print $ filter (> 3) [1, 2, 3, 4, 5, 6]
