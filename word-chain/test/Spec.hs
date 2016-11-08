import Test.Hspec (Spec, describe, it, shouldBe, context)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)

import WordChain

main :: IO ()
main = hspecWith defaultConfig specs

specs :: Spec
specs = describe "word chain" $ do

          context "shortestPath" $ do
            describe "when the start and the end word are the same" $ do
              it "returns that word" $
                shortestPath "test" "test" `shouldBe` Right ["test"]

            describe "when the start and the end word are different lengths" $ do
              it "fails with a message that strings of different lengths cannot produce a valid word chain" $
                shortestPath "test" "failme" `shouldBe` Left "length mismatch"

            describe "when there is a one character difference between the words" $ do
              it "returns a list containing the two words" $
                shortestPath "bat" "mat" `shouldBe` Right ["bat", "mat"]

          context "isNeighbor" $ do
            describe "given two words" $ do
              it "is true when words have one letter difference" $
                isNeighbor "bat" "mat" `shouldBe` True

          context "neighbors" $ do
            describe "given a dictionary and a word" $ do
              it "returns an empty list when there are no neighbors in the dictionary" $
                neighbors ["matt"] "mat" `shouldBe` []

              it "returns a list with all neighbors" $
                neighbors ["bat", "cat", "boat", "hot"] "bot" `shouldBe` ["bat", "hot"]
