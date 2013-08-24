module Electric.Flow where

-- | The flow represents how fast a pack moves,
-- it has a direct relation on the energy
-- of a pack.
newtype EnergyFlow = EF Int
                   deriving Eq
