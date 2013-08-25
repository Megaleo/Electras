module Electric.Spin where

import qualified Electric.Direction as D

-- | The spin of a pack can determinate
-- what direction it will go if it encounter
-- a 2 path decision.
data Spin = ToLeft
          | ToRight
          deriving Eq

-- | Converts Spin to a direction.
spinToDirection :: Spin -> D.Direction
spinToDirection ToLeft  = D.DirLeft
spinToDirection ToRight = D.DirRight
