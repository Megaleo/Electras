module World
    ( WorldState (..)
    , World
    ) where

import Data.IORef
-- import Data.StateVar

import qualified Electric.Circuit as C

-- | The state of the world, contains a name and the Circuit
data World = World String C.Circuit

type WorldState = IORef World
