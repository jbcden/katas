module WordChain
    ( shortestPath
    , isNeighbor
    , neighbors
    ) where

import System.Environment

data WordTree word = Node word [WordTree word] deriving (Show)

type WordPath = [String]

advance :: [String] -> [WordPath] -> [WordPath]
advance words [] = []
advance words paths = let iteration = concat 
                                    $ map (generateChildPaths) paths
                          generateChildPaths as = map (:as) 
                                                $ filter (`notElem` as)
                                                $ neighbors words (head as)
                      in iteration ++ (advance words iteration)

dictionary = "/usr/share/dict/words"

search start term words = take 1 $ filter ((== term) . head) $advance words [[start]]

shortestPath :: String -> String -> Either String [String]
shortestPath start end | start == end = Right [start]
                       | length start /= length end = Left "length mismatch"
                       | otherwise = error "Not implemented"

readDictionary :: IO String
readDictionary = readFile dictionary

allTheWords :: IO [String]
allTheWords = fmap (lines) readDictionary

isNeighbor :: String -> String -> Bool
isNeighbor a b = distance == 1
  where distance = foldl (\acc (a, b) -> if a /= b then acc + 1 else acc) 0 $ zip a b

neighbors :: [String] -> String -> [String]
neighbors dict word = filter (isNeighbor word)
                    $ filter ((length word ==) . length) dict

buildTree :: [String] -> String -> WordTree String
buildTree dict word = Node word myNeighborTrees
  where myNeighbors = neighbors dict word
        myNeighborTrees = map (buildTree dict) myNeighbors
