module Main where

import System.Environment

data Sex = Male | Female deriving(Show, Eq, Read)
getHarris_Benedict :: Sex -> Double -> Double -> Double -> Double
getHarris_Benedict Male   h w a =  66.4730 + (13.7516 * w) + (5.0033 * h) - (6.7550 * 20)
getHarris_Benedict Female h w a =  655.0955 + (9.5634 * w) + (1.8496 * h) - (4.6756 * 20)

main = do
    (s:h:w:a:_)<- getArgs
    putStrLn . show $ getHarris_Benedict (read s)(read h) (read w) (read a)
