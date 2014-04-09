module Workout(
              Workout(..)
              , lossCalorie
              , ) where

import Data.Calorie

data Workout = Run | Swim | Bike | Walk deriving Eq
lossCalorie :: Workout -> Float -> Float -> Calorie
lossCalorie Run weight km = Just $ weight * km
lossCalorie _ _ _  = Nothing
