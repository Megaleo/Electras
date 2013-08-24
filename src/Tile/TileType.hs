module Tile.TileType
    ( TileType (..)
    ) where

import qualified Components as C
import Electric.Tendency

-- | Specifies the kind of a tile and
-- stores all the data about it.
data TileType = InfSource C.SourceData -- ^ Infinite source of energy.
              | Wire                   -- ^ Transports energy in packs.

-- | Natural Energy Tendency of a TileType.
naturalET :: TileType -> EnergyTendency
naturalET (InfSource _) = ET 1
naturalET Wire          = ET 0
