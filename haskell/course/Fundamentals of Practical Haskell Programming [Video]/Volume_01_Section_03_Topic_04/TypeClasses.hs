------------------------------------------------------------
--
-- TypeClasses.hs
-- Code sample accompanying topic 1.3.4 "Type classes"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

class Frobber a where
    frob :: a -> (String, Integer)

data A = A { aValue :: Int }
instance Frobber A where
    frob a = let value = aValue a in (show value, toInteger value)

data B = B { bValue :: Integer }
instance Frobber B where
    frob b = let value = bValue b in (show value, toInteger value)

data C = C { cValue :: Double }
instance Frobber C where
    frob c = let value = cValue c in (show value, round value)

printFrobResult :: Frobber a => a -> IO ()
printFrobResult = print . frob

main :: IO ()
main = do
    printFrobResult (A 100)
    printFrobResult (B (2 ^ 70))
    printFrobResult (C 3.141)
