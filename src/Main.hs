module Main where

import qualified Meal as M
import qualified Util.Util as U
import qualified Util.Translate as T
import Data.Time
import Control.Applicative


filename :: IO String
filename = getCurrentTime >>= return
                                . (\(y, m, d ) -> show y ++ zeroFill2 m ++ zeroFill2 d)
                                . toGregorian
                                . utctDay
        where
            zeroFill2 = zeroFill 2

zeroFill :: (Integral a, Show a) => Int -> a -> String
zeroFill len n = if l >= len
                    then n'
                    else  (take (len - l) . repeat $ '0') ++ n'
        where
            n' = show n
            l = length n'



main :: IO ()
main = do
    let windows = "C:/HOME/learning_haskell/calorie/daily_data"
    let mac = "/Users/theatrical/learning_haskell/calorie_hs/daily_data"
    file <- pure (\x -> windows ++ "/" ++ x ++ ".txt") <*> filename
    meal <- M.insertMeal
    appendFile file . (++ "\n ") . show $ meal


