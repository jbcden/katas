module WordChain
    ( shortestPath,
    ) where

import System.Environment

dictionary = "/usr/share/dict/words"

shortestPath :: String -> String -> [String]
shortestPath _ _ = ["test"]

readDictionary :: IO String
readDictionary = readFile dictionary

allTheWords :: IO [String]
allTheWords = fmap lines readDictionary
