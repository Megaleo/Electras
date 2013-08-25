module Electric.Pack where

import qualified Electric.Energy as E
import qualified Electric.Flow as F
import qualified Electric.Spin as S
import qualified Electric.Direction as D

-- | A pack is the minimal particle of energy,
-- it contains energy flow to moviment and
-- pure energy.
data Pack = Pack { pPureEnergy :: E.PureEnergy
                 , pEnergyFlow :: F.EnergyFlow
                 , pSpin       :: S.Spin
                 , pDirection  :: D.Direction
                 } deriving Eq

-- | The total energy of a pack.
-- It is formed by multiplying the
-- pure energy with the energy flow.
newtype EnergyPack = EP Int

-- | Multiplies the pure energy an the energy flow
-- to the the energy.
energyPack :: E.PureEnergy -> F.EnergyFlow -> EnergyPack
energyPack (E.PE pe) (F.EF ef) = EP $ pe * ef

-- | Calculates the energy pack of a pack,
-- by multiplying the pure energy with the energy flow
packEnergy :: Pack -> EnergyPack
packEnergy (Pack pe ef _ _) = energyPack pe ef
