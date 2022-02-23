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

module Database.Entity.User where

import           Data.Text        (Text)
import           Database.DbCore
import           GHC.Generics     (Generic)
import           Hasql.Connection as Connection
import           Hasql.Session
import           Hasql.Statement
import           Prelude
import           Rel8
import Data.Int (Int32)

data AuthProviderType = IVY | GOOGLE
    deriving (Generic)
    deriving stock (Read, Show)
    deriving DBType via ReadShow AuthProviderType


data UserEntity f =
  UserEntity
    { _id     :: Column f Text
    , _email  :: Column f  Text
    , _passwordHash :: Column f Text
    , _authProviderType :: Column f AuthProviderType
    , _firstName :: Column f Text
    , _lastName :: Column f (Maybe Text)
    , _profilePictureUrl :: Column f (Maybe Text)
    , _color :: Column f Int32
    , _endColor :: Column f (Maybe Int32)
    , _testUser :: Column f Bool
    }
  deriving (Generic)
  deriving anyclass (Rel8able)

deriving stock instance f ~ Result => Show (UserEntity f)

userSchema :: TableSchema (UserEntity Name)
userSchema =
  TableSchema
    { name = "users"
    , schema = Nothing
    , columns =
        UserEntity {
            _id = "id", 
            _email = "email",
            _passwordHash = "password_hash",
            _authProviderType = "auth_provider_type",
            _firstName = "first_name",
            _lastName = "last_name",
            _profilePictureUrl = "profile_picture_url",
            _color = "color",
            _endColor = "end_color",
            _testUser = "test_user"
        }
    }

allUsers :: Statement () [UserEntity Result]
allUsers = select $ each userSchema
