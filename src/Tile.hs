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
import qualified Electric as E

-- | Representation of a single tile in the screen.
-- It stores the the type and maybe a pack.
data Tile = Tile TileType (Maybe E.Pack)

tileType :: Tile -> TileType
tileType (Tile tt _) = tt

tilePack :: Tile -> Maybe E.Pack
tilePack (Tile _ p) = p

type CTile = (C.Coord, Tile)

-- | Calculates where a pack must go,
-- given the tiles on all four directions
-- relative to it.
packDirection :: E.Pack -> [(E.Direction, Tile)] -> E.Direction
packDirection (E.Pack _ _ spin dir) tiles
    | length possibles == 1                               = fst $ head possibles
    | isWire $ tileType tileAhead                         = dir
    | and $ map (isWire . tileType) [tileLeft, tileRight] = E.normalizeToUp dir (E.spinToDirection spin)
    | isWire $ tileType tileLeft                          = E.normalizeToUp dir E.DirLeft
    | isWire $ tileType tileRight                         = E.normalizeToUp dir E.DirRight
    | otherwise                                           = dir
        where
            possibles = zip (fst $ unzip tiles) $ filter (isWire . tileType) $ snd $ unzip tiles
            tileAhead = fromJust $ lookup dir tiles
            tileLeft  = fromJust $ lookup (E.normalizeToUp dir E.DirLeft) tiles
            tileRight = fromJust $ lookup (E.normalizeToUp dir E.DirRight) tiles
