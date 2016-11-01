import Test.Hspec (Spec, describe, it, shouldBe, context)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)

import WordChain

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} specs

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
            describe "given a word and a dictionary" $ do
              it "is true when words have one letter difference" $
                isNeighbor "bat" "mat" `shouldBe` True
