module World
    ( WorldState (..)
    , World
    ) where

import Data.IORef
-- import Data.StateVar

import qualified Electric.Circuit as C

-- | The state of the world, contains a name and circuits
data WorldState = WorldState String [C.Circuit]

type World = IORef WorldState
