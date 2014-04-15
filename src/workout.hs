module Workout(
              Workout(..)
              , lossCalorie
							, insertWorkout
              , ) where

import Data.Calorie

data Workout = Run | Swim | Bike | Walk deriving (Eq, Read)
lossCalorie :: Workout -> Double -> Double -> Calorie
lossCalorie Run weight km = Just $ weight * km
lossCalorie _ _ _  = Nothing

insertWorkout :: IO Calorie
insertWorkout = do
	putStrLn "Workout Type"
	wType <- fmap read getLine :: IO Workout
	putStrLn "Weight (kg)"
	kg <- fmap read getLine :: IO Double
	putStrLn "Distance (km)"
	distance <- fmap read getLine :: IO Double
	return $ lossCalorie wType kg distance


