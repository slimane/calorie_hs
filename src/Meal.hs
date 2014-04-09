module Meal (Nutrient, calorie, protein, fat, carbon, NutrientQuantity, defaultNutrient, Meal) where

type NutrientQuantity = Maybe Float
data Nutrient = Nutrient{calorie :: NutrientQuantity
                        , protein :: NutrientQuantity
                        , fat :: NutrientQuantity
                        , carbon :: NutrientQuantity}
                      deriving(Show, Eq, Read, Ord)
data Meal = Meal{name :: String, nutrient :: Nutrient, date :: String} deriving(Show, Eq, Read, Ord)

defaultNutrient :: Nutrient
defaultNutrient = Nutrient{calorie = Nothing, protein = Nothing, fat = Nothing, carbon = Nothing}

