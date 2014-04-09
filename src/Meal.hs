module Meal (Nutrient, calorie, protein, fat, carbon, NutrientQuantity, defaultNutrient, Meal, nAdd) where

import Data.Monoid
import Control.Applicative

type NutrientQuantity = Maybe Float
data Nutrient = Nutrient{calorie :: NutrientQuantity
                        , protein :: NutrientQuantity
                        , fat :: NutrientQuantity
                        , carbon :: NutrientQuantity}
                      deriving(Show, Eq, Read, Ord)

nAdd :: Nutrient -> Nutrient -> Nutrient
a `nAdd` b = Nutrient{calorie  = cal, protein = p, fat = f, carbon = c}
    where
        a ++ b = (+) <$> a <*> b
        cal = calorie a ++ calorie b
        p = protein a ++ protein b
        f = fat a ++ fat b
        c = carbon a ++ carbon b

data Meal = Meal{name :: String, nutrient :: Nutrient, date :: String} deriving(Show, Eq, Read, Ord)

defaultNutrient :: Nutrient
defaultNutrient = Nutrient{calorie = Nothing, protein = Nothing, fat = Nothing, carbon = Nothing}
