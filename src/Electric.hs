module Electric
    ( ElectricData (..)
    ) where

-- | Stores all the data to find the flow
-- and the energy in a single tile. It may be
-- used when it matters the whole tile, not the
-- type of it, for example.
-- It might be removed for testing purposes.
data ElectricData = ElectricData
