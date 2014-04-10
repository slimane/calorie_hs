module Util.Util(
                applyBothSide
                ) where

applyBothSide :: (t1 -> t1 -> t2) -> (t -> t1) -> t -> t -> t2
applyBothSide f g x y = g x `f` g y
