module Tile
    ( Tile (..)
    ) where

import Tile.TileType
import qualified Electric as E

-- | Representation of a single tile in the screen.
-- It stores the the type and maybe a pack.
data Tile = Tile TileType (Maybe E.Pack)