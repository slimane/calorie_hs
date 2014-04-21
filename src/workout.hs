module Workout(
              WorkoutKind(..)
              , lossCalorie
              , insertWorkout
              , ) where

import Data.Calorie

data Workout = Workout{kind :: WorkoutKind, distance :: Double}
data WorkoutKind = Run | Swim | Bike | Walk deriving (Eq, Read)
lossCalorie :: WorkoutKind -> Double -> Double -> Maybe Calorie
lossCalorie Run weight km = Just $ weight * km
lossCalorie _ _ _  = Nothing

insertWorkout :: IO (Maybe Calorie)
insertWorkout = do
  putStrLn "Workout Type"
  wType <- fmap read getLine :: IO WorkoutKind
  putStrLn "Weight (kg)"
  kg <- fmap read getLine :: IO Double
  putStrLn "Distance (km)"
  distance <- fmap read getLine :: IO Double
  return $ lossCalorie wType kg distance
