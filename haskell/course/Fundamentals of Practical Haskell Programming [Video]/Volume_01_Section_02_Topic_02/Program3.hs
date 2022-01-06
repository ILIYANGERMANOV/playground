------------------------------------------------------------
--
-- Program3.hs
-- Code sample accompanying topic 1.2.2 "Whitespace, layout and scoping"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

main =
    -- This indentation, however, is illegal
    -- This program WILL NOT COMPILE
    let
x = 5
y = 6
    in print (x + y)
