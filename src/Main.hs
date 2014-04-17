module Main where

import qualified Meal as M
import qualified Workout as W
import qualified Util.Util as U
import qualified Util.Translate as T
import Data.Time
import Control.Applicative
import System.Environment
import Control.Monad
import Data.List


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



--main :: IO ()
main = do
    x <- getArgs
    let cmd  = if length x > 0 then head x else ""
    let windows = "C:/HOME/learning_haskell/calorie/daily_data"
    let mac = "/Users/theatrical/learning_haskell/calorie_hs/daily_data"
    file <- pure (\x -> windows ++ "/" ++ x ++ ".txt") <*> filename
    contents <- case cmd of
                        "workout" -> W.insertWorkout >>= return . ("--- Wokout\n- " ++) .  show
                        "add"     -> M.insertMeal >>= return . M.showMeal
                        _         -> return ""
    when (contents /= "") $ appendFile file . (++ "\n ") $ contents
    appededContents <- fmap lines $ readFile file
    mapM_ (putStrLn . (++ "\n"). show) appededContents
    let a = filter (isInfixOf "Nutrient") appededContents
    putStrLn $ "##### Total #####\n"
                    ++ (show
                        . foldl1 M.nAdd
                        . map (read :: String -> M.Nutrient)
                        . filter (isInfixOf "Nutrient")
                        $ appededContents)
    return ()
