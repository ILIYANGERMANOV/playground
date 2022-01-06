------------------------------------------------------------
--
-- Factorial.hs
-- Code sample accompanying topic 1.1.3 "The Haskell Way"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

factorial n = if n < 2 then 1 else n * factorial (n - 1)

main = print $ factorial 5
