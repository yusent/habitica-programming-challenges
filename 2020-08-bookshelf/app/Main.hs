module Main where

import Prelude hiding (getContents)
import System.IO.Strict (getContents)
import Lib

main :: IO ()
main = do
  (shelvesLine : bookLines) <- lines <$> getContents
  let shelves = createShelf . read <$> words shelvesLine
      books = createBook . words <$> bookLines
  case minBookshelves shelves books of
       Just minShelves -> print minShelves
       Nothing -> putStrLn "impossible"

createBook :: [String] -> Book
createBook (sizeStr : titleWords) = Book (read sizeStr) (unwords titleWords)
createBook _ = error "bad input"
