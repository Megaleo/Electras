module Tile
    ( Tile (..)
    , module Tile.TileType
    ) where

import Tile.TileType
import qualified Electric as E

-- | Representation of a single tile in the screen.
-- It stores the the type and the total electric data.
data Tile = Tile TileType E.ElectricData