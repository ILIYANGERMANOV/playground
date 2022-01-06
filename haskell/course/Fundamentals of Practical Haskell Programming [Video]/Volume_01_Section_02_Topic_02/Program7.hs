------------------------------------------------------------
--
-- Program7.hs
-- Code sample accompanying topic 1.2.2 "Whitespace, layout and scoping"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

f x y = a + b
    where
        a = x
        b = y

g x y = a + b
    where x = a
          y = b

a = undefined; b = undefined
main = undefined
