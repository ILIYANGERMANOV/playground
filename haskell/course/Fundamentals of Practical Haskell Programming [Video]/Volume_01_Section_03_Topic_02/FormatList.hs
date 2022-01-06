------------------------------------------------------------
--
-- FormatList.hs
-- Code sample accompanying topic 1.3.2 "Types and type signatures"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

import Data.List

formatList :: String -> String -> String -> [String] -> String
formatList start end separator xs = start ++ (intercalate separator (map show xs)) ++ end

main :: IO ()
main = putStrLn $ formatList "<list>" "</list>" "|" ["first", "second", "third", "fourth"]
