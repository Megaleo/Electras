module Electric.Energy where

-- | The Pure Energy is just a pure form
--  of energy, multiplied by the flow, you
-- get the Energy of a pack.
newtype PureEnergy = PE Int
                   deriving Eq
