module Tile.TileType
    ( TileType (..)
    , isWire
    ) where

import qualified Electric as E

-- | Specifies the kind of a tile and
-- stores all the data about it.
data TileType = InfSource E.Pack         -- ^ Infinite source of energy.
              | Wire                   -- ^ Transports energy in packs.

isWire :: TileType -> Bool
isWire Wire = True
isWire _    = False
