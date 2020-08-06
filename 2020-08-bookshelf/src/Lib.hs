{-# LANGUAGE RecordWildCards #-}

module Lib (Book(..), createShelf, minBookshelves, minBookshelvesCount) where

import Data.List (intercalate, sortOn)
import Data.Ord (Down(..))

data Shelf = Shelf { capacity :: Int, books :: [Book] } deriving (Eq, Ord)
data Book = Book { size :: Int, title :: String } deriving (Eq, Ord)

instance Show Shelf where
  show Shelf{..} = intercalate " | " $ (show . size <$> books) ++ [show capacity ++ " empty"]

minBookshelvesCount :: [Book] -> [Shelf] -> Maybe Int
minBookshelvesCount books = fmap length . minBookshelves books

minBookshelves :: [Book] -> [Shelf] -> Maybe [Shelf]
minBookshelves books shelves = takeWhile hasBooks <$> minBookshelves' (descSort books) (descSort shelves)

minBookshelves' :: [Book] -> [Shelf] -> Maybe [Shelf]
minBookshelves' [] = Just
minBookshelves' (book : books) = maybe Nothing (minBookshelves' books) . insertBook book

insertBook :: Book -> [Shelf] -> Maybe [Shelf]
insertBook _ [] = Nothing
insertBook book (shelf : shelves)
  | capacity shelf >= size book = Just $ addBook shelf book : shelves
  | otherwise = (shelf :) <$> insertBook book shelves

addBook :: Shelf -> Book -> Shelf
addBook shelf@Shelf{..} book@Book{..} =
  shelf { capacity = capacity - size, books = book : books }

hasBooks :: Shelf -> Bool
hasBooks = not . null . books

createShelf :: Int -> Shelf
createShelf capacity = Shelf { capacity = capacity, books = [] }

descSort :: Ord a => [a] -> [a]
descSort = sortOn Down
