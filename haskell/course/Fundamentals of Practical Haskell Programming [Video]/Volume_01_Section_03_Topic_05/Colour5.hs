------------------------------------------------------------
--
-- Colour5.hs
-- Code sample accompanying topic 1.3.5 "Pattern matching"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

data Colour = RGB Int Int Int deriving Show

red :: Colour -> Int
red (RGB r _ _) = r

main :: IO ()
main = print $ red (RGB 100 200 300)
