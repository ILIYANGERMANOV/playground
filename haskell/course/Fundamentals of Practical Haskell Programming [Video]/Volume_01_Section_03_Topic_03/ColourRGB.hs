------------------------------------------------------------
--
-- ColourRGB.hs
-- Code sample accompanying topic 1.3.3 "Algebraic data types"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module ColourRGB (Colour) where

data Colour = RGB Int Int Int deriving Show
