module Tile
    ( Tile (..)
    , module Tile.TileType
    ) where

import Tile.TileType
import qualified Electric as E

data Tile = Tile TileType E.ElectricData