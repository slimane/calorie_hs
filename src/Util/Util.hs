module Util.Util(
                applyBoth
                ) where

applyBoth :: (t1 -> t1 -> t2) -> (t -> t1) -> t -> t -> t2
applyBoth f g x y = g x `f` g y
