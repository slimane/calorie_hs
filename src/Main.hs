module Main where

import qualified Meal as M
import qualified Util.Util as U
import qualified Util.Translate as T
import qualified System.Directory as D



main :: IO ()
main = do
    let windows = "C:/HOME/learning_haskell/calorie/daily_data"
    let mac = "/Users/theatrical/learning_haskell/calorie_hs/daily_data"
    let file = windows ++ "/" ++ "20140414.txt"
    meal <- M.insertMeal
    appendFile file . (++ "\n ") . show $ meal
