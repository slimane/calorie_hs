module Meal (
            Nutrient(..)
            , NurietKind(..)
            , Meal(..)
            , NutrientQuantity
            , insertMeal
            , insertNutrient
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
import Control.Exception as E
import qualified Data.Time as T

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

insertNutrient :: IO Nutrient
insertNutrient = do
        c1 <- prompt "calorie"  :: IO (Maybe Double)
        p <- prompt "protein"   :: IO (Maybe Double)
        f <- prompt "fat"       :: IO (Maybe Double)
        c2 <- prompt "carbon"   :: IO (Maybe Double)
        return defaultNutrient{calorie = c1, protein = p, fat = f, carbon = c2}
    where
        prompt s = do
                    putStrLn $ s ++ " is?"
                    n <- getLine
                    if n == ""
                        then return $ Nothing
                        else return $ Just (read n)


data Meal = Meal{name :: Maybe String, nutrient :: Nutrient, date :: Maybe T.ZonedTime} deriving(Show, Read, Eq, Ord)

instance Eq T.ZonedTime where
    x == y = T.zonedTimeToUTC x == T.zonedTimeToUTC y

instance Ord T.ZonedTime where
    x `compare` y = T.zonedTimeToUTC x `compare` T.zonedTimeToUTC y




defaultMeal :: Meal
defaultMeal = Meal{name = Nothing, nutrient = defaultNutrient, date = Nothing}

insertMeal :: IO Meal
insertMeal = do
        n <- prompt "name" :: IO (Maybe String)
        nu <- insertNutrient
        d <- T.getZonedTime
        return defaultMeal{name = n, nutrient = nu, date = Just d}
    where
        prompt s = do
                    putStrLn $ s ++ " is?"
                    n <- getLine
                    return $ Just n
