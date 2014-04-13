module Main where

import  Meal
--import qualified List.Meal
--import Workout
import qualified Util.Util as U
import qualified Util.Translate as T
--import Data.Time
--import Data.Time.Lens



main :: IO ()
main = do
    let windows = "C:/HOME/learning_haskell/calorie/daily_data"
    let mac = "/Users/theatrical/learning_haskell/calorie_hs/daily_data"
    let oatsMeal_100 = defaultNutrient {calorie = Just (T.jouleToCalorie 719), protein = Just 5.0, fat = Just 3.0, carbon = Just 27} `nMal` (100 / 40)
    let n_list =  [
                  (oatsMeal_100 `nMal` 0.41)
                  , defaultNutrient {calorie  =  Just 77,  protein  =  Just (12.3 * 0.7),  fat  =  Just (10.3 * 0.7),  carbon  =  Just (0.3 * 0.7)}
                  , defaultNutrient {calorie  =  Just 67,  protein  =  Just 0.72,  fat  =  Just 4.1,  carbon  =  Just 6.8} `nMal` 13
                  , defaultNutrient {calorie  =  Just 268,  protein  =  Just 4.3,  fat  =  Just 17.3, carbon  =  Just 23.8}
                  , defaultNutrient {calorie  =  Just 221,  protein  =  Just 3.5,  fat  =  Just 14.2, carbon  =  Just 19.9}
                  , defaultNutrient {calorie  =  Just 369,  protein  =  Just 4.1,  fat  =  Just 22.3, carbon  =  Just 40.5}
                  , defaultNutrient {calorie  =  Just 542,  protein  =  Just 20.1,  fat  =  Just 21.5, carbon  =  Just 66.9}
                  ]
    let total = show $ foldl1 nAdd n_list
    writeFile (mac ++ "/" ++ "20140413.txt") $
                                                total
                                                ++ "\n"
                                                ++ (foldl1 (++) . map  ( (++ "\n") . show) $ n_list)
    putStrLn total
    putStrLn . show $ (U.applyBoth (+) $ (*24) . length ) "1234567" "89"
