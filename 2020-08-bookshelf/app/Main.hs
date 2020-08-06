module Main where

import Prelude hiding (getContents)
import System.Environment (getArgs)
import System.IO.Strict (getContents)
import Data.Maybe (fromMaybe)
import Bookshelf

main :: IO ()
main = do
  args <- getArgs
  (shelvesLine : bookLines) <- lines <$> getContents
  let shelves = createShelf . read <$> words shelvesLine
      books = createBook . words <$> bookLines

  putStrLn . fromMaybe "impossible"
    $ case args of
           ("bonus" : _) -> unlines . map show <$> minBookshelves books shelves
           _ -> show <$> minBookshelvesCount books shelves

createBook :: [String] -> Book
createBook (sizeStr : titleWords) = Book (read sizeStr) (unwords titleWords)
createBook _ = error "bad input"
