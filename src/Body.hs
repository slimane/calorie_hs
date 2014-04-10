module Body where

type bodyData = Maybe Float

data = Body{height :: bodyData, weight :: bodyData, muscle_mass :: bodyDatam, age :: Maybe Int} deriving(Shwo, Eq, Ord, Read)
defaultBody :: Body
defaultBody = {height = Nothing, weight = Nothing, muscle_mass = Nothing, age = Nothing}
