------------------------------------------------------------
--
-- Colour4.hs
-- Code sample accompanying topic 1.3.5 "Pattern matching"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

data Colour = RGB Int Int Int | CMYK Float Float Float Float deriving Show

{-
-- Function declaration pattern match
colourModel :: Colour -> String
colourModel (RGB _ _ _) = "RGB"
colourModel (CMYK _ _ _ _) = "CMYK"
-}

{-
-- case..of pattern match
colourModel :: Colour -> String
colourModel c =
    case c of RGB _ _ _ -> "RGB"
              CMYK _ _ _ _ -> "CMYK"
-}

-- Non-exhaustive pattern match
colourModel :: Colour -> String
colourModel c =
    case c of RGB _ _ _ -> "RGB"

main :: IO ()
main = do
    let c = CMYK 100 200 300 400
    putStrLn $ colourModel c
