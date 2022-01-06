------------------------------------------------------------
--
-- Quaternion1.hs
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
    }

instance Show Quaternion where
    show q = "(" ++
        show (qR q) ++ " + " ++
        show (qI q) ++ "i + " ++
        show (qJ q) ++ "j + " ++
        show (qK q) ++ "k)"

main :: IO ()
main = print $ Q 1 2 3 4
