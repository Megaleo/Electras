module Electric.Direction where

import TileType.Coord

-- | Directions
data Direction = Up
               | Down
               | Left
               | Right

-- | Turns a direction into a unitary
-- coordinate, based on SDL coordinates system.
directionCoord :: Direction -> Coord
directionCoord Up    = (0,-1)
directionCoord Down  = (0, 1)
directionCoord Right = (1, 0)
directionCoord Left  = (-1,0)
