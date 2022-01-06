------------------------------------------------------------
--
-- Nums.hs
-- Code sample accompanying topic 1.3.2 "Types and type signatures"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

import Data.Complex
import Data.Ratio

n0 :: Int
n0 = 5

n1 :: Double
n1 = 5.0

n2 :: Complex Double
n2 = 2 :+ 3

n3 :: Ratio Int
n3 = 2 % 3

main :: IO ()
main = do
    print n0
    print n1
    print n2
    print n3
