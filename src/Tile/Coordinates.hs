module Tile.Coordinates where

-- | Int coordinate
data Coord = (Int, Int)

-- | Double coordinate
data DCoord = (Double, Double)

-- | Rounds a DCoord
roundDCoord :: DCoord -> Coord
roundDCoord (a, b) = (round a, round b)

-- | Does the @ceiling@ function on a DCoord
ceilingDCoord :: DCoord -> Coord
ceilingDCoord (a, b) = (ceiling a, ceiling b)

-- | Does the @floor@ function on a DCoord
floorDCoord :: DCoord -> Coord
floorDCoord (a, b) = (floor a, floor b)
