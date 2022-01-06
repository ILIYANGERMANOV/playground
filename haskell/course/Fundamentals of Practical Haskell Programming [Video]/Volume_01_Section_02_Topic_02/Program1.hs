------------------------------------------------------------
--
-- Program1.hs
-- Code sample accompanying topic 1.2.2 "Whitespace, layout and scoping"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

main =
    -- This is a valid indentation
    let
        x = 5
        y = 6
    in print (x + y)
