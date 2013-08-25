module Tile.Coordinates where

-- | Int coordinate
type Coord = (Int, Int)

-- | Double coordinate
type DCoord = (Double, Double)

-- | Rounds a DCoord
roundDCoord :: DCoord -> Coord
roundDCoord (a, b) = (round a, round b)

-- | Does the @ceiling@ function on a DCoord
ceilingDCoord :: DCoord -> Coord
ceilingDCoord (a, b) = (ceiling a, ceiling b)

-- | Does the @floor@ function on a DCoord
floorDCoord :: DCoord -> Coord
floorDCoord (a, b) = (floor a, floor b)

(|+|) :: Coord -> Coord -> Coord
(x1,y1) |+| (x2,y2) = (x1 + x2, y1 + y2)

(|-|) :: Coord -> Coord -> Coord
(x1,y1) |-| (x2,y2) = (x1 - x2, y1 - y2)

(|*|) :: Coord -> Int -> Coord
(x1,y1) |*| m = (x1 * m, y1 * m)

(|/|) :: Coord -> Int -> Coord
(x1,y1) |/| d = (x1 `div` d, y1 `div` d)

(||+||) :: DCoord -> DCoord -> DCoord
(x1,y1) ||+|| (x2,y2) = (x1 + x2, y1 + y2)

(||-||) :: DCoord -> DCoord -> DCoord
(x1,y1) ||-|| (x2,y2) = (x1 - x2, y1 - y2)

(||*||) :: DCoord -> Double -> DCoord
(x1,y1) ||*|| m = (x1 * m, y1 * m)

(||/||) :: DCoord -> Double -> DCoord
(x1,y1) ||/|| d = (x1 / d, y1 / d)
