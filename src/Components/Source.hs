module Components.Source
    ( SourceData (..)
    ) where

import Electric.Pack
import Electric.Direction

-- | The data to define a source of
-- energy, that sends a pack to its
-- output on a direction.
data SourceData = SourceData Pack Direction
