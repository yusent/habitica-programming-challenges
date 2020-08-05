{-# LANGUAGE RecordWildCards #-}

module Lib (Book(..), createShelf, minBookshelves) where

import Data.List (intercalate)
import Data.Maybe (isJust, fromJust)

data Shelf = Shelf { capacity :: Int, books :: [Book] }
data Book = Book { size :: Int, title :: String }

instance Show Shelf where
  show Shelf{..} = intercalate " | " $ (show . size <$> books) ++ [show capacity ++ " empty"]

minBookshelves :: [Shelf] -> [Book] -> Maybe Int
minBookshelves shelves books
  | null arrangements = Nothing
  | otherwise = Just . minimum $ map length arrangements
  where
    arrangements = possibleArrangements shelves books

possibleArrangements :: [Shelf] -> [Book] -> [[Shelf]]
possibleArrangements shelves =
  map (filter hasBooks . fromJust) . filter isJust . possibleArrangementsMaybe shelves

possibleArrangementsMaybe :: [Shelf] -> [Book] -> [Maybe [Shelf]]
possibleArrangementsMaybe [] [] = [Just []]
possibleArrangementsMaybe [] _ = [Nothing]
possibleArrangementsMaybe shelves [] = if valid (head shelves) then [Just shelves] else [Nothing]
possibleArrangementsMaybe (shelf : otherShelves) books@(book : otherBooks)
  | valid shelf = possibleArrangementsMaybe (updatedShelf : otherShelves) otherBooks
               ++ (fmap (shelf :) <$> possibleArrangementsMaybe otherShelves books)
  | otherwise = [Nothing]
  where
    updatedShelf = addBook shelf book

addBook :: Shelf -> Book -> Shelf
addBook shelf@Shelf{..} book@Book{..} =
  shelf { capacity = capacity - size, books = book : books }

valid :: Shelf -> Bool
valid = (>= 0) . capacity

hasBooks :: Shelf -> Bool
hasBooks = not . null . books

createShelf :: Int -> Shelf
createShelf capacity = Shelf { capacity = capacity, books = [] }
