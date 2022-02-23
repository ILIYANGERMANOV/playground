{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PolyKinds         #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE TypeOperators     #-}

module Logic.Data.User where

import           Control.Monad.IO.Class   (liftIO)
import           Data.Aeson
import           Data.Int                 (Int32)
import           Data.Proxy
import           Data.Text
import           Data.UUID
import           Database.DbCore          (executeQuery)
import           GHC.Generics
import           Network.Wai
import           Network.Wai.Handler.Warp ()
import           Prelude                  hiding (id)
import           Rel8                     (Result)
import           Servant
import           Servant.API.Generic
import           Servant.Server.Generic   ()
import Database.Entity.AuthProviderType

data User =
  User
    { id                :: UUID
    , email             :: Text
    , passwordHash      :: Text
    , authProviderType  :: AuthProviderType
    , firstName         :: Text
    , lastName          :: Maybe Text
    , profilePictureUrl :: Maybe Text
    , color             :: Int32
    , endColor          :: Maybe Int32
    , testUser          :: Bool
    }
  deriving (Generic, Show)

instance FromJSON User

instance ToJSON User