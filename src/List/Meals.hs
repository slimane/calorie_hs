module List.Meals where

import Meal

oatsMeal_100 = defaultNutrient {calorie = Just (T.jouleToCalorie 719), protein = Just 5.0, fat = Just 3.0, carbon = Just 27} `nMal` (100 / 40)

eggM = defaultNutrient {calorie = Just 77, protein = Just (12.3 * 0.7), fat = Just (10.3 * 0.7), carbon = Just (0.3 * 0.7)}
