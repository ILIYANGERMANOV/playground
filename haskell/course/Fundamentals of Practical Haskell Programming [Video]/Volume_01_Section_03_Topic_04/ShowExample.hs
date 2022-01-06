------------------------------------------------------------
--
-- ShowExample.hs
-- Code sample accompanying topic 1.3.4 "Type classes"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

import Data.Complex
import Data.Ratio

main :: IO ()
main = do
    print 5
    print 5.0
    print "five"
    print (5 :+ 6)
    print (5 % 6)
