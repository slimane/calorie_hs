module Main where

import Meal
import Workout
import Util.Util
--import Data.Time
--import Data.Time.Lens



main :: IO ()
main = do
    let breakFirst = defaultNutrient {calorie = Just 225, protein = Just 5.3, fat = Just 3.9, carbon = Just 41.9}
    let lunch1 = defaultNutrient {calorie = Just 319, protein = Just 4.9, fat = Just 7.9, carbon = Just 57.4}
    let lunch2 = defaultNutrient {calorie = Just (107 * 2), protein = Just (14.4 * 2), fat = Just (4.8 * 2), carbon = Just (1.48 * 2)}
    let dinner = defaultNutrient {calorie = Just 363, protein = Just 16.3, fat = Just 5.8, carbon = Just 59.1}
    let total = show $ foldl1 nAdd [breakFirst, lunch1, lunch2, dinner]
    writeFile "c:/HOME/learning_haskell/calorie/daily_data/20140410.txt" total
    putStrLn . show $ (applyBothSide (+) $ (*24) . length ) "1234567" "89"
