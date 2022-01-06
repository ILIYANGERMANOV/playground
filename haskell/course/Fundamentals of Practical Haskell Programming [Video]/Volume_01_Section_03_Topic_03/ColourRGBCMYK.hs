------------------------------------------------------------
--
-- ColourRGBCMYK.hs
-- Code sample accompanying topic 1.3.3 "Algebraic data types"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module ColourRGBCMYK (Colour) where

data Colour = RGB Int Int Int | CMYK Float Float Float Float deriving Show
