module LibSpec (spec) where

import Test.Hspec
import Lib

spec :: Spec
spec = do
  describe "minBookshelves" $ do
    it "should calculate the minimum number of shelves require to fit the given books" $ do
      let shelves = [150, 150, 300, 150, 150]
          books = [ (70, "A Game of Thrones")
                  , (76, "A Clash of Kings")
                  , (99, "A Storm of Swords")
                  , (75, "A Feasts for Crows")
                  , (105, "A Dance With Dragons")
                  ]
      minBookshelves shelves books `shouldBe` Just 2


    it "should return Nothing if fitting the books is impossible" $ do
      let shelves = [500, 500, 500]
          books = [ (1309, "Artamene")
                  , (303, "A la recherche du temps perdu")
                  , (399, "Mission Earth")
                  ]
      minBookshelves shelves books `shouldBe` Nothing
