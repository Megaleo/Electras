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
import qualified Electric.Spin as S

-- | Representation of a single tile in the screen.
-- It stores the the type and maybe a pack.
data Tile = Tile TileType (Maybe P.Pack)

tileType :: Tile -> TileType
tileType (Tile tt _) = tt

tilePack :: Tile -> Maybe P.Pack
tilePack (Tile _ p) = p

type CTile = (C.Coord, Tile)

-- | Calculates where a pack must go,
-- given the tiles on all four directions
-- relative to it.
packDirection :: P.Pack -> [(D.Direction, Tile)] -> D.Direction
packDirection (P.Pack _ _ spin dir) tiles
    | length possibles == 1                               = fst $ head possibles
    | isWire $ tileType tileAhead                         = dir
    | and $ map (isWire . tileType) [tileLeft, tileRight] = D.normalizeToUp dir (S.spinToDirection spin)
    | isWire $ tileType tileLeft                          = D.normalizeToUp dir D.DirLeft
    | isWire $ tileType tileRight                         = D.normalizeToUp dir D.DirRight
    | otherwise                                           = dir
        where
            possibles = zip (fst $ unzip tiles) $ filter (isWire . tileType) $ snd $ unzip tiles
            tileAhead = fromJust $ lookup dir tiles
            tileLeft  = fromJust $ lookup (D.normalizeToUp dir D.DirLeft) tiles
            tileRight = fromJust $ lookup (D.normalizeToUp dir D.DirRight) tiles
