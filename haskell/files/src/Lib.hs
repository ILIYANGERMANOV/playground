module Lib
    ( someFunc,
      NFT (NFT)
    ) where

data NFT = NFT {
  id :: String,
  ipfs :: String
} deriving (Show, Eq, Ord)

someFunc :: IO ()
someFunc = putStrLn "someFunc"
