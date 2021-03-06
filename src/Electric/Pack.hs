module Electric.Pack
    ( Pack (..)
    , EnergyPack (..)
    , energyPack
    , packEnergy
    ) where

import qualified Electric.Energy as E
import qualified Electric.Flow as F
import qualified Electric.Direction as D
import qualified Tile.Coordinates as C

-- | A pack is the minimal particle of energy,
-- it contains energy flow to moviment and
-- pure energy.
data Pack = Pack { pPureEnergy :: E.PureEnergy
                 , pEnergyFlow :: F.EnergyFlow
                 , pDirection  :: D.Direction
                 } deriving Eq

-- | The total energy of a pack.
-- It is formed by multiplying the
-- pure energy with the energy flow.
newtype EnergyPack = EP Int

movePacks :: [(C.Coord, Maybe Pack)] -> [(C.Coord, Maybe Pack)]
movePacks ((c, p1) : ps) =
        case p1 of
            Nothing -> (c, Nothing) : movePacks ps
            Just p  -> [(c, Nothing), (c D.|+| directionCoord (pDirection p), p1)] ++ movePacks ps


-- | Multiplies the pure energy an the energy flow
-- to the the energy.
energyPack :: E.PureEnergy -> F.EnergyFlow -> EnergyPack
energyPack (E.PE pe) (F.EF ef) = EP $ pe * ef

-- | Calculates the energy pack of a pack,
-- by multiplying the pure energy with the energy flow
packEnergy :: Pack -> EnergyPack
packEnergy (Pack pe ef _ _) = energyPack pe ef

-- | Change Direction
changeDirection :: Pack -> D.Direction -> Pack
changeDirection (Pack pe ef _) direction = Pack pe ef direction

-- | Adjust Direction by applying a function
adjustDirection :: Pack -> (D.Direction -> D.Direction) -> Pack
adjustDirection (Pack pe ef d) adjust = Pack pe ef $ adjust d

-- | Change the Pure Energy
changePureEnergy :: Pack -> E.PureEnergy -> Pack
changePureEnergy (Pack _ ef d) pureEnergy = Pack pureEnergy ef d

-- | Adjust the Pure Energy by applying a function
adjustPureEnergy :: Pack -> (E.PureEnergy -> E.PureEnergy) -> Pack
adjustPureEnergy (Pack pe ef d) adjust = Pack (adjust pe) ef d

-- | Change the Energy Flow
changeEnergyFlow :: Pack -> F.EnergyFlow -> Pack
changeEnergyFlow (Pack pe _ d) energyFlow = Pack pe energyFlow d

-- | Adjust the Energy Flow by applying a function
adjustEnergyFlow :: Pack -> (F.EnergyFlow -> F.EnergyFlow) -> Pack
adjustEnergyFlow (Pack pe ef d) adjust = Pack pe (adjust ef) d
