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
import           Database.DbCore          (executeQuery)
import           Database.Entity.User
import           GHC.Generics
import           Network.Wai
import           Network.Wai.Handler.Warp ()
import           Prelude                  hiding (id)
import           Rel8                     (Result)
import           Servant
import           Servant.API.Generic
import           Servant.Server.Generic   ()

data User =
  User
    { id                :: Text
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

instance FromJSON AuthProviderType

instance ToJSON AuthProviderType

instance FromJSON User

instance ToJSON User

toUser :: UserEntity Rel8.Result -> User
toUser e =
  User
    { id = _id e
    , email = _email e
    , passwordHash = _passwordHash e
    , authProviderType = _authProviderType e
    , firstName = _firstName e
    , lastName = _lastName e
    , profilePictureUrl = _profilePictureUrl e
    , color = _color e
    , endColor = _endColor e
    , testUser = _testUser e
    }
