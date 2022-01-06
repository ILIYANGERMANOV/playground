main :: IO ()
main = putStrLn $ greet "World"

greeting = "Howdy, "
greet who = greeting ++ who

data Compass = North | East | West | South

instance Show Compass where
  show North = "N"
  show East = "E"
  show West = "W"
  show South = "S"

data Expression = Number Int
                | Add Expression Expression
                | Subtract Expression Expression
                deriving (Eq, Ord, Show)

calculate :: Expression -> Int
calculate (Number x) = x
calculate (Add x y) = (calculate x) + (calculate y)
calculate (Subtract x y) = (calculate x) - (calculate y)

newHead :: [a] -> a
newHead [] = error "empty list"
newHead (x : xs) = x

newTail :: [a] -> [a]
newTail [] = error "empty list"
newTail (x : xs) = xs
