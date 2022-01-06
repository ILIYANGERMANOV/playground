import Expression
import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec $ do
  describe "calculate" $ do
    it "can calculate numbers" $ do
      (calculate (Number 1)) `shouldBe` 1
      (calculate (Number 9)) `shouldBe` 9

    it "can add numbers" $ do
      (calculate (Add (Number 1) (Number 9))) `shouldBe` 10

    it "can add complex expressions" $ do
      (calculate (Add (Add (Number 1) (Number 9)) (Subtract (Number 5) (Number 2)))) `shouldBe` 13

    it "can calculate any number" $
      property $ \x -> calculate (Number x) == x

    it "can add any numbers" $
      property $ \x y -> calculate (Add (Number x) (Number y)) == x + y

    it "can add any trees" $
      property $ \x y -> calculate (Add x y) == (calculate x) + (calculate y)

    it "can subtract any trees" $
      property $ \x y -> calculate (Subtract x y) == (calculate x) + (calculate y)
