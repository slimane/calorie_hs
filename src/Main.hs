module Main where

import Meal


mm :: Num a => Maybe a -> Maybe a -> Maybe a
Nothing `mm` _ = Nothing
_ `mm` Nothing = Nothing
Just a `mm` Just b = Just $ a + b


main = do
  let breakFirst = defaultNutrient {calorie = Just 334, protein = Just 7.5, fat = Just 5.4, carbon = Just 63.4}
  let lunch = defaultNutrient {calorie = Just 308, protein = Just 44.1, fat = Just 2.4, carbon = Just 26.9}
  putStrLn . show $ breakFirst
  putStrLn . show $ lunch
  putStrLn . show $ breakFirst `nAdd` lunch
