module Util.Translate (
                      calorieToJoule
                      , jouleToCalorie
                    ) where
calorieToJoule :: Fractional a => a -> a
calorieToJoule = (*) 4.1868

jouleToCalorie :: Fractional a => a -> a
jouleToCalorie = (*) 0.239

