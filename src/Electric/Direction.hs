module Electric.Direction where

import Tile.Coordinates

-- | Directions
data Direction = DirUp
               | DirDown
               | DirLeft
               | DirRight

-- | Turns a direction into a unitary
-- coordinate, based on SDL coordinates system.
directionCoord :: Direction -> Coord
directionCoord DirUp    = (0,-1)
directionCoord DirDown  = (0, 1)
directionCoord DirRight = (1, 0)
directionCoord DirLeft  = (-1,0)
