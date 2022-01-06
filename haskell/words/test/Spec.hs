import Test.Hspec
import Lib

main :: IO ()
main = hspec $ do
  describe "Test 1" $ do
    it "Should be able to pass." $ do
      someString `shouldBe` "someString"
      length someString `shouldBe` 3
