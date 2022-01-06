import System.Random

type Grid = [String]
type Words = [String]

data GridConfig = GridConfig {
  width :: Int,
  height :: Int
}

gameWords = [
        "BUBU",
        "PUPU",
        "MARMOZETKA"
        ]

duplicate :: String -> Int -> String
duplicate string n = concat $ replicate n string

emptyGrid :: GridConfig -> Grid
emptyGrid cfg =
    let w = width cfg
        h = height cfg
        line = duplicate "_ " w
    in replicate h line


initGrid :: Words -> GridConfig -> Grid
initGrid gameWords cfg = emptyGrid cfg

putWordInLine :: String -> String -> GridConfig -> String
putWordInLine word line cfg = do
  r <- randomInt
  (word ++ line)

outputGrid :: Grid -> IO ()
outputGrid grid = putStrLn $ unlines grid

randomInt :: IO Int
randomInt = randomRIO (1, 10 :: Int)

main :: IO ()
main = do
  r <- randomRIO (1, 10 :: Int)
  print $ show r
  let grid = initGrid gameWords (GridConfig 15 15)
  outputGrid grid
