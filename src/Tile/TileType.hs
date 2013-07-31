module Tile.TileType
    ( TileType (..)
    ) where

import qualified Components as C

data TileType = InfSource C.SourceData
              | Wire C.WireData