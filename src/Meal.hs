module Meal (
            Nutrient(..)
            , NurietKind(..)
            , Meal(..)
            , NutrientQuantity
            , defaultNutrient
            , defaultMeal
            , calorieCal
            , nAdd
            , cMinus
            ) where

import Data.Monoid()
import Control.Applicative
import Data.Calorie

type NutrientQuantity = Maybe Float
data Nutrient = Nutrient{calorie :: Calorie
                        , protein :: NutrientQuantity
                        , fat :: NutrientQuantity
                        , carbon :: NutrientQuantity}
                      deriving(Show, Eq, Read, Ord)

nAdd :: Nutrient -> Nutrient -> Nutrient
a `nAdd` b = Nutrient{calorie  = cal, protein = p, fat = f, carbon = c}
    where
        nAdd' :: NutrientQuantity -> NutrientQuantity -> NutrientQuantity
        m1 `nAdd'` m2 = (+) <$> m1 <*> m2
        nAdd'' :: Calorie -> Calorie -> Calorie
        nAdd'' = nAdd'
        cal = calorie a `nAdd''` calorie b
        p = protein a `nAdd'` protein b
        f = fat a `nAdd'` fat b
        c = carbon a `nAdd'` carbon b

cMinus :: Nutrient -> Calorie -> Calorie
cMinus nu c = calorie nu `nMinus'` c
    where
      m1 `nMinus'` m2  =  (-) <$> m1 <*> m2


data NurietKind = Protein | Carbon | Fat deriving Eq
calorieCal :: NurietKind -> NutrientQuantity -> NutrientQuantity
calorieCal _ Nothing = Nothing
calorieCal Protein (Just n) = Just ( 4 * n )
calorieCal Carbon (Just n) = Just ( 4 * n )
calorieCal Fat (Just n) = Just ( 9 * n )

defaultNutrient :: Nutrient
defaultNutrient = Nutrient{calorie = Nothing, protein = Nothing, fat = Nothing, carbon = Nothing}

data Meal = Meal{name :: String, nutrient :: Maybe Nutrient, date :: String} deriving(Show, Eq, Read, Ord)
defaultMeal :: Meal
defaultMeal = Meal{name = "",  nutrient = Nothing, date = ""}

