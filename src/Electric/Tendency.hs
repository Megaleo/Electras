module Electric.Tendency where

-- | The energy tendency of a tile is
-- represent the tencency of a pack to
-- move to is. More tendencity means higher
-- chance of a pack moving to it, if it is
-- the tile that has the bigger energy tendency.
-- Tiles that requires an energy input transmits its
-- tendency along the cable or other material, depending
-- on its tendency isolation.
newtype EnergyTendency = ET Int