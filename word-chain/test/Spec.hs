import Test.Hspec (Spec, describe, it, shouldBe)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)

import WordChain

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} specs

specs :: Spec
specs = describe "word chain" $ do
          describe "when the start and the end word are the same" $ do
            it "returns that word" $
              shortestPath "test" "test" `shouldBe` ["test"]
