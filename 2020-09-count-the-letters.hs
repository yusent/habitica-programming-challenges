-- Challenge Description:
-- Write a program that is able to count the letters (without space, comma,
-- etc.) of a phrase you put in

import Data.Char (isAlpha)

main :: IO ()
main = getLine >>= print . length . filter isAlpha
