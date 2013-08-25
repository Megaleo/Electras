module Tile.TileType
    ( TileType (..)
    ) where

import qualified Electric as E

-- | Specifies the kind of a tile and
-- stores all the data about it.
data TileType = InfSource E.Pack         -- ^ Infinite source of energy.
              | Wire                   -- ^ Transports energy in packs.
