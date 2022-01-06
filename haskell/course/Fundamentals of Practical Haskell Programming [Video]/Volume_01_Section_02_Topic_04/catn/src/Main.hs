------------------------------------------------------------
--
-- Main.hs
-- Code sample accompanying topic 1.2.4 "Debugging with GHCi"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module Main (main) where

import Control.Monad
import System.Environment

main :: IO ()
main = do
    args <- getArgs
    forM_ args $ \path -> do
        content <- readFile path
        putStrLn $ "File: " ++ path
        forM_ (zip [1..] (lines content)) $ \(n, line) -> do
            putStrLn $ " " ++ show n ++ ": " ++ line
