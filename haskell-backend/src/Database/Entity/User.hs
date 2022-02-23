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
import           Prelude hiding (id)
import           Rel8
import Data.Int (Int32)
import Data.UUID
import Data.UUID (UUID)
import Logic.Utils
import Logic.Data.User
import Database.Entity.AuthProviderType


data UserEntity f =
  UserEntity
    { _id     :: Column f UUID
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

userById :: UUID -> Statement () [UserEntity Result]
userById userId = select $ do
  user <- each userSchema
  where_ $ _id user ==. lit userId
  return user

userByEmail :: Text -> Statement () [UserEntity Result]
userByEmail email = select $ do
  user <- each userSchema
  where_ $ _email user ==. lit email
  return user

saveUser user = Insert {
  into = userSchema,
  rows = values [ UserEntity {
    _id = lit $ id user,
    _email = lit $ email user,
    _passwordHash = lit $ passwordHash user,
    _authProviderType = lit $ authProviderType user,
    _firstName = lit $ firstName user,
    _lastName = lit $ lastName user,
    _profilePictureUrl = lit $ profilePictureUrl user,
    _color = lit $ color user,
    _endColor = lit $ endColor user,
    _testUser = lit $ testUser user
  }],
  onConflict = DoUpdate (Upsert UserEntity),
  returning = pure ()
}

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