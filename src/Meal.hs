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
import Data.BaseUnit

type NutrientQuantity = BaseUnit
data Nutrient = Nutrient{calorie :: Calorie
                        , protein :: NutrientQuantity
                        , fat :: NutrientQuantity
                        , carbon :: NutrientQuantity}
                      deriving(Show, Eq, Read, Ord)

nAdd :: Nutrient -> Nutrient -> Nutrient
a `nAdd` b = Nutrient{calorie  = cal, protein = p, fat = f, carbon = c}
    where
        nAdd' :: BaseUnit -> BaseUnit -> BaseUnit
        m1 `nAdd'` m2 = (+) <$> m1 <*> m2
        cal = calorie a `nAdd'` calorie b
        p = protein a `nAdd'` protein b
        f = fat a `nAdd'` fat b
        c = carbon a `nAdd'` carbon b

cMinus :: Nutrient -> Calorie -> Calorie
cMinus nu c = calorie nu `nMinus'` c
    where
      m1 `nMinus'` m2  =  (-) <$> m1 <*> m2


data NurietKind = Protein | Carbon | Fat deriving Eq
calorieCal :: NurietKind -> NutrientQuantity -> Calorie
calorieCal _ Nothing = Nothing
calorieCal Protein jn = fmap (4*) jn
calorieCal Carbon  jn = fmap (4*) jn
calorieCal Fat     jn = fmap (9*) jn

defaultNutrient :: Nutrient
defaultNutrient = Nutrient{calorie = Nothing, protein = Nothing, fat = Nothing, carbon = Nothing}

data Meal = Meal{name :: String, nutrient :: Maybe Nutrient, date :: String} deriving(Show, Eq, Read, Ord)
defaultMeal :: Meal
defaultMeal = Meal{name = "",  nutrient = Nothing, date = ""}

