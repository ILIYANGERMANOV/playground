module Lib
    ( someFunc,
      NFT (NFT)
    ) where


data ApprovalAction = Approve{
  signature :: String
} | Reject

data NFT = NFT {
  nftId :: String,
  ipfs :: String
} deriving (Show, Eq, Ord)

data Participant = Participant {
  pId :: String,
  nft :: NFT,
  deposit :: Double
} deriving (Show)

data Vote = Vote {
  voterId :: String,
  nomNftId :: String
} deriving (Show)

data PrizeCuts = PrizeCuts {
  first :: Double,
  second :: Double,
  third :: Double,
  host :: Double
} deriving (Show)

data Game = Game {
  gameId :: String,
  ps :: [Participant],
  votes :: [Vote],
  cuts :: PrizeCuts
} deriving (Show)

newGame :: Game
newGame = Game "game" [] [] (PrizeCuts 0.6 0.24 0.1 0.06)


sum :: [Int] -> Int
sum [] = 0
sum [x] = x
sum (x: xs) = x + sum xs 



enterGame :: Game -> Participant -> Game
enterGame game p = game {
  ps = let gamePs = ps game in
      case gamePs of
          [] -> [p]
          -- TODO: validate participant
          _ -> (p : gamePs)
}

prize :: Game -> Double
prize game = let
      gPs = ps game
      deposits = map (deposit) gPs
      in
      foldr (+) 0 deposits

hostPrize :: Game -> Double
hostPrize game =
            let
              hostCut = (host . cuts) game
            in prize game * hostCut

winnersPrize :: Game -> (Double, Double, Double)
winnersPrize game =
            let
              gamePrize = prize game
              gameCuts = cuts game
            in
              (
                gamePrize * (first gameCuts),
                gamePrize * (second gameCuts),
                gamePrize * (third gameCuts)
              )

nfts :: Game -> [NFT]
nfts game = map (nft) (ps game)

vote :: Game -> Participant -> Vote -> Game
vote game p v = game {
  votes = let gVotes = votes game in
        case gVotes of
          [] -> [v]
          gvs | invalidVote gvs -> gvs
              | otherwise -> (v : gVotes)
}

invalidVote gvs = True

votesFor :: NFT -> Game -> [Vote]
votesFor nft game = filter (\v -> nomNftId v == nftId nft) $ votes game


someFunc :: IO ()
someFunc = putStrLn "someFunc"
