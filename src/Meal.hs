module Meal (
            Nutrient(..)
            , NurietKind(..)
            , Meal(..)
            , NutrientQuantity
            , defaultNutrient
            , defaultMeal
            , calorieCal
            , nAdd
            , nMal
            , nDiv
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

nMal :: Nutrient -> Double -> Nutrient
n `nMal` a = Nutrient{calorie  = cal, protein = p, fat = f, carbon = c}
    where
        nMal' :: BaseUnit -> Double -> BaseUnit
        n' `nMal'` a' = fmap (a' *) n'
        cal = calorie n `nMal'` a
        p = protein n `nMal'` a
        f = fat n `nMal'` a
        c = carbon n `nMal'` a

nDiv :: Nutrient -> Double -> Nutrient
n `nDiv` a = n `nMal` (1 / a)

cMinus :: Nutrient -> Calorie -> Calorie
cMinus nu c = calorie nu `nMinus'` c
    where
      m1 `nMinus'` m2  =  (-) <$> m1 <*> m2


data NurietKind = Protein | Carbon | Fat deriving Eq
calorieCal :: NurietKind -> NutrientQuantity -> Calorie
calorieCal Protein = fmap (4*)
calorieCal Carbon  = fmap (4*)
calorieCal Fat     = fmap (9*)

defaultNutrient :: Nutrient
defaultNutrient = Nutrient{calorie = Nothing, protein = Nothing, fat = Nothing, carbon = Nothing}

data Meal = Meal{name :: String, nutrient :: Nutrient, date :: String} deriving(Show, Eq, Read, Ord)
defaultMeal :: Meal
defaultMeal = Meal{name = "",  nutrient = defaultNutrient, date = ""}

