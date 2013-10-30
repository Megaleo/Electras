module Tile
    ( Tile (..)
    , tileType
    , tilePack
    , CTile
    , packDirection
    ) where

import Data.Maybe

import Tile.TileType
import qualified Tile.Coordinates as C
import qualified Electric.Direction as D
import qualified Electric.Pack as P

-- | Representation of a single tile in the screen.
-- It stores the the type and maybe a pack.
data Tile = Tile TileType (Maybe P.Pack)

zipTile :: [TileType] -> [Maybe P.Pack] -> [Tile]
zipTile (tt : tts) (p : ps) = Tile tt p : zipTile tts ps
zipTile [] _                = []
zipTile _  []               = []

unzipTile :: [Tile] -> ([TileType], [Maybe P.Pack])
unzipTile tiles = unzip $ map (\t_ -> (tileType t_, tilePack t_)) tiles

tileType :: Tile -> TileType
tileType (Tile tt _) = tt

tilePack :: Tile -> Maybe P.Pack
tilePack (Tile _ p) = p

type CTile = (C.Coord, Tile)
