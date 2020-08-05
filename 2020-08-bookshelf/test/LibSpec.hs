module LibSpec (spec) where

import Test.Hspec
import Lib

spec :: Spec
spec = do
  describe "minBookshelves" $ do
    it "should calculate the minimum number of shelves require to fit the given books" $ do
      let shelves = createShelf <$> [150, 150, 300, 150, 150]
          books = [ Book 70 "A Game of Thrones"
                  , Book 76 "A Clash of Kings"
                  , Book 99 "A Storm of Swords"
                  , Book 75 "A Feasts for Crows"
                  , Book 105 "A Dance With Dragons"
                  ]
      minBookshelves shelves books `shouldBe` Just 2


    it "should return Nothing if fitting the books is impossible" $ do
      let shelves = createShelf <$> [500, 500, 500]
          books = [ Book 1309 "Artamene"
                  , Book 303 "A la recherche du temps perdu"
                  , Book 399 "Mission Earth"
                  ]
      minBookshelves shelves books `shouldBe` Nothing
