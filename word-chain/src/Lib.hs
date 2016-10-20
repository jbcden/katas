module Lib
    ( readDictionary,
      allTheWords
    ) where

import System.Environment

dictionary = "/usr/share/dict/words"

readDictionary :: IO String
readDictionary = readFile dictionary

allTheWords :: IO [String]
allTheWords = fmap lines readDictionary
