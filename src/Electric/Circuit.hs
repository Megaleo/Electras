module Electric.Circuit
    ( Circuit (..)
    ) where

import qualified Tile as T

-- | A circuit is formed by sources, that provides energy,
-- by transporters, to transport energy and consumers,
-- that consumes energy. All have their own coordinates.
-- It is a form of tile organization.
type Circuit = [CTile]
