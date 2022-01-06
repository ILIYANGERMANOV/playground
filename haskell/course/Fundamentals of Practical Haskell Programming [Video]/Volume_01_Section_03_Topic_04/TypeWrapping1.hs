------------------------------------------------------------
--
-- TypeWrapping1.hs
-- Code sample accompanying topic 1.3.4 "Type classes"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

data Quaternion = Q { qR :: Double, qI :: Double, qJ :: Double, qK :: Double }

newtype PrettyQuaternion = PrettyQuaternion { unPrettyQuaternion :: Quaternion }
instance Show PrettyQuaternion where
    show q = let q' = unPrettyQuaternion q in "(" ++
        show (qR q') ++ " + " ++
        show (qI q') ++ "i + " ++
        show (qJ q') ++ "j + " ++
        show (qK q') ++ "k)"

newtype UglyQuaternion = UglyQuaternion { unUglyQuaternion :: Quaternion }
instance Show UglyQuaternion where
    show q = let q' = unUglyQuaternion q in
        show (qR q') ++ "," ++
        show (qI q') ++ "," ++
        show (qJ q') ++ "," ++
        show (qK q') ++ ")"

main :: IO ()
main = do
    print $ PrettyQuaternion (Q 1 2 3 4)
    print $ UglyQuaternion (Q 1 2 3 4)
