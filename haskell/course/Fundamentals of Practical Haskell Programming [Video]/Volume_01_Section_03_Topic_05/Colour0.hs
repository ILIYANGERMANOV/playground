------------------------------------------------------------
--
-- Colour0.hs
-- Code sample accompanying topic 1.3.5 "Pattern matching"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

data Colour = RGB Int Int Int deriving Show

main :: IO ()
main = print $ RGB 10 20 30
