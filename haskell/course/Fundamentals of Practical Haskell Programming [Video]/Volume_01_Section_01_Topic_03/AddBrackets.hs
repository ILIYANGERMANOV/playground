------------------------------------------------------------
--
-- AddBrackets.hs
-- Code sample accompanying topic 1.1.3 "The Haskell Way"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

addBrackets s = "[" ++ s ++ "]"

result = map addBrackets ["one", "two", "three"]

main = print result
