module Tile.TileType
    ( TileType (..)
    ) where

import qualified Components as C

-- | Specifies the kind of a tile and
-- stores all the data about it.
data TileType = InfSource C.SourceData -- ^ Infinite source of energy.
              | Wire                   -- ^ Transports energy in packs.
