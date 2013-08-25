module Electric.Spin where

-- | The spin of a pack can determinate
-- what direction it will go if it encounter
-- a 2 path decision.
data Spin = ToLeft
          | ToRight