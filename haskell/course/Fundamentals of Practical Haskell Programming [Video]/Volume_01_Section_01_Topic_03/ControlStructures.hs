------------------------------------------------------------
--
-- ControlStructures.hs
-- Code sample accompanying topic 1.1.3 "The Haskell Way"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

myIf True thenFunc elseFunc = thenFunc
myIf False thenFunc elseFunc = elseFunc

main =
    let x = 5
    in print $ myIf (x == 5) "is five" "is not five"
