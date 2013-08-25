module Electric.Direction where

import Tile.Coordinates

-- | Directions
data Direction = DirUp
               | DirDown
               | DirLeft
               | DirRight
               deriving Eq

-- | Turns a direction into a unitary
-- coordinate, based on SDL coordinates system.
directionCoord :: Direction -> Coord
directionCoord DirUp    = (0,-1)
directionCoord DirDown  = (0, 1)
directionCoord DirRight = (1, 0)
directionCoord DirLeft  = (-1,0)

oppositeDir :: Direction -> Direction
oppositeDir DirUp    = DirDown
oppositeDir DirRight = DirLeft
oppositeDir DirLeft  = DirRight
oppositeDir DirDown  = DirUp

-- | Returns the direction relative to Up.
normalizeToUp :: Direction -> Direction -> Direction
normalizeToUp DirUp dir         = dir

normalizeToUp DirDown dir       = normalizeToUp DirUp $ oppositeDir dir

normalizeToUp DirLeft DirUp     = DirLeft
normalizeToUp DirLeft DirDown   = DirRight
normalizeToUp DirLeft DirLeft   = DirDown
normalizeToUp DirLeft DirRight  = DirUp

normalizeToUp DirRight dir      = normalizeToUp DirLeft $ oppositeDir dir