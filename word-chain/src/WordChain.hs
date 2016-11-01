module WordChain
    ( shortestPath
    , isNeighbor
    ) where

import System.Environment

dictionary = "/usr/share/dict/words"

shortestPath :: String -> String -> Either String [String]
shortestPath start end | start == end = Right [start]
                       | length start /= length end = Left "length mismatch"
                       | otherwise = error "Not implemented"

readDictionary :: IO String
readDictionary = readFile dictionary

allTheWords :: IO [String]
allTheWords = fmap lines readDictionary

-- isNeighbor :: String -> String -> Bool
isNeighbor a b = foldl (\acc (a, b) -> if a /= b then acc + 1 else acc) 0 $ zip a b
