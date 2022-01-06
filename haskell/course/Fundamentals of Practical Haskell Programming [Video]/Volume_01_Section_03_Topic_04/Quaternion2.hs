------------------------------------------------------------
--
-- Quaternion2.hs
-- Code sample accompanying topic 1.3.4 "Type classes"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

data Quaternion = Q
    { qR :: Double
    , qI :: Double
    , qJ :: Double
    , qK :: Double
    } deriving Show

main :: IO ()
main = print $ Q 1 2 3 4
