{-# language BlockArguments #-}
{-# language DeriveAnyClass #-}
{-# language DeriveGeneric #-}
{-# language DerivingStrategies #-}
{-# language DerivingVia #-}
{-# language DuplicateRecordFields #-}
{-# language GeneralizedNewtypeDeriving #-}
{-# language OverloadedStrings #-}
{-# language StandaloneDeriving #-}
{-# language TypeApplications #-}
{-# language TypeFamilies #-}

module Database.Entity.AuthProviderType where

import           Servant.API.Generic
import Rel8
import Data.Aeson


data AuthProviderType = IVY | GOOGLE
    deriving (Generic)
    deriving stock (Read, Show)
    deriving DBType via ReadShow AuthProviderType

    
instance FromJSON AuthProviderType

instance ToJSON AuthProviderType