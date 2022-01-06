------------------------------------------------------------
--
-- Program8.hs
-- Code sample accompanying topic 1.2.2 "Whitespace, layout and scoping"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

f x = case x of p0 -> a
                p1 -> b

g x = case x of
        p0 -> a
        p1 -> b

a = undefined; b = undefined
main = undefined
