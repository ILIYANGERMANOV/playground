data MyData = MyData Bool String deriving Show

boolName :: MyData -> String
boolName (MyData True s) = "true that " ++ s
boolName (MyData False s) = "Nahh " ++ s

main :: IO ()
main = do
  let x = MyData False "Haskell" in
    print $ boolName x
