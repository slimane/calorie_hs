module Main where

import Meal
import Workout
--import Data.Time
--import Data.Time.Lens



main :: IO ()
main = do
  let breakFirst = defaultNutrient {calorie = Just 334, protein = Just 7.5, fat = Just 5.4, carbon = Just 63.4}
  let lunch = defaultNutrient {calorie = Just 308, protein = Just 44.1, fat = Just 2.4, carbon = Just 26.9}
  let dinner1 = defaultNutrient {calorie = Just 298, protein = Just 4.6, fat = Just 15.0 , carbon = Just 36.1}
  let dinner2 = defaultNutrient {calorie = Just 176.4, protein = Just 33, fat = Just 2.208, carbon = Just 3.675}
  let total = foldl1 nAdd [ breakFirst, lunch, dinner1, dinner2 ]
  putStrLn . show $ total
  putStrLn . ("protein is " ++) . show . calorieCal Protein $ protein total
  putStrLn . ("carbon is " ++) . show . calorieCal Carbon $ carbon total
  putStrLn . ("Fat is " ++) . show . calorieCal Fat $ fat total
  putStrLn . show $ lossCalorie Run 65 14
  putStrLn . show $ total `cMinus` lossCalorie Run 65 14
