------------------------------------------------------------
--
-- Program6.hs
-- Code sample accompanying topic 1.2.2 "Whitespace, layout and scoping"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

f = do
        a
        b
        c

g = do a
       b
       c

a :: IO () -- type signature required to give f an unambiguous type
a = undefined; b = undefined; c = undefined
main = undefined
