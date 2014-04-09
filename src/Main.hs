module Main where

import Meal




main = do
  putStrLn . show $ defaultNutrient {calorie = Just 334, protein = Just 7.5, fat = Just 5.4, carbon = Just 63.4}
  putStrLn . show $ defaultNutrient {calorie = Just 308, protein = Just 44.1, fat = Just 2.4, carbon = Just 26.9}
