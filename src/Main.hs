module Main where

import Meal
--import Workout
import Util.Util
--import Data.Time
--import Data.Time.Lens



main :: IO ()
main = do
    let windows = "C:/HOME/learning_haskell/calorie/daily_data"
    let mac = "$HOME/learning_haskell/calorie_hs/daily_data"
    let breakFirst = defaultNutrient {calorie = Just 337, protein = Just 7.5, fat = Just 5.4, carbon = Just 63.4}
    let lunch = defaultNutrient {calorie = Just 190, protein = Just 3.8, fat = Just 4.0, carbon = Just 36.6}
    let butadon = defaultNutrient {calorie = Just 373, protein = Just 11.2, fat = Just 6.8, carbon = Just 68.5}
    let beaf = defaultNutrient {calorie = Just 109, protein = Just 20.3, fat = Just 1.7, carbon = Just 3.0}
    let total = show $ foldl1 nAdd [breakFirst, lunch, butadon, beaf]
    writeFile (windows ++ "/" ++ "20140411.txt") total
    putStrLn total
    putStrLn . show $ (applyBothSide (+) $ (*24) . length ) "1234567" "89"
