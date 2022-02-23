{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PolyKinds         #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE TypeOperators     #-}

module Api.AuthApi where

import           Api.TransactionsApi
import           Control.Monad.IO.Class
import           Data.Aeson
import           Data.Proxy
import           Data.Text
import           GHC.Generics
import           Network.Wai
import           Network.Wai.Handler.Warp
import           Prelude
import           Servant
import           Servant.API.Generic
import           Servant.Server.Generic   ()

data SignUpRequest =
  SignUpRequest
    { email     :: Text
    , password  :: Text
    , firstName :: Text
    , lastName  :: Maybe Text
    , color     :: Int
    , fcmToken  :: Maybe Text
    }
  deriving (Generic, Show)

instance FromJSON SignUpRequest

instance ToJSON SignUpRequest

-- type AuthAPI
--    = "sign-up" :> ReqBody '[ JSON] SignUpRequest :> Post '[ JSON] Greet
