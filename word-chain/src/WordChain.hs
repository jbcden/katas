module WordChain
    ( shortestPath,
    ) where

import System.Environment

dictionary = "/usr/share/dict/words"

shortestPath :: String -> String -> [String]
shortestPath start end | start == end = [start]
                       | otherwise = error "Not implemented"

readDictionary :: IO String
readDictionary = readFile dictionary

allTheWords :: IO [String]
allTheWords = fmap lines readDictionary
