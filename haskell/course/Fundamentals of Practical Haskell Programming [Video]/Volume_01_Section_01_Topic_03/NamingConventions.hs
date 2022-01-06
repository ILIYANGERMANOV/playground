------------------------------------------------------------
--
-- NamingConventions.hs
-- Code sample accompanying topic 1.1.3 "The Haskell Way"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module Main (main) where

data MyType = MyDataConstructor String

class MyClass a where
    name :: a -> String

instance MyClass MyType where
    name (MyDataConstructor name) = name

func x = x
func' y = y

main = do
    print $ name (MyDataConstructor "Haskell")
    print $ 100 + 200
    print $ (+) 100 200
