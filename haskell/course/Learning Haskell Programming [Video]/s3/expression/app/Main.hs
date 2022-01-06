module Main where

import Expression

main :: IO ()
main = putStrLn . show $ calculate (Add (Number 1) (Number 2))
