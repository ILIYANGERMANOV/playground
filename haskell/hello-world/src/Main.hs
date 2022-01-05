module Main where

double x = x + x

power x = x * x

main = print $ map (power . double) [5,7,9]
