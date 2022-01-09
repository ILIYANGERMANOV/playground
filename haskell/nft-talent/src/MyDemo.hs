module MyDemo (
  myTest
) where

myTest :: Int -> String
myTest v
    | v >= 15 = "Good"
    | v >= 10 = "Okay"
    | otherwise = "Fail"
