{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PolyKinds         #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE TypeOperators     #-}

module Api.AuthApi where

import           Api.TransactionsApi
import           Control.Monad                    (guard)
import           Control.Monad.IO.Class
import           Data.Aeson
import           Data.Int                         (Int32)
import           Data.Password.Bcrypt
import           Data.Proxy
import           Data.Text
import           Data.UUID
import           Data.UUID.V4
import           Database.DbCore
import           Database.Entity.AuthProviderType
import           Database.Entity.User
import           GHC.Generics
import           Logic.Data.User                  (User (profilePictureUrl))
import qualified Logic.Data.User                  as U
import           Logic.Utils
import           Logic.Validation
import           Network.Wai
import           Network.Wai.Handler.Warp
import           Prelude                          hiding (id)
import           Servant
import           Servant.API.Generic
import           Servant.Server.Generic           ()

data SignUpRequest =
  SignUpRequest
    { email     :: Text
    , password  :: Text
    , firstName :: Text
    , lastName  :: Maybe Text
    , color     :: Int32
    , fcmToken  :: Maybe Text
    }
  deriving (Generic, Show)

instance FromJSON SignUpRequest

instance ToJSON SignUpRequest

data AuthResponse =
  AuthResponse
    { user         :: User
    , sessionToken :: Text
    }

type AuthAPI
   = "sign-up" :> ReqBody '[ JSON] SignUpRequest :> Post '[ JSON] AuthResponse

validateSignUp :: SignUpRequest -> Either Text SignUpRequest
validateSignUp req
  | blank (email req) = Left $ msgCannotBeBlank "email"
  | blank (password req) = Left $ msgCannotBeBlank "password"
  | blank (firstName req) = Left $ msgCannotBeBlank "firstName"
  | otherwise = Right req

signUp :: SignUpRequest -> IO (Either Text AuthResponse)
signUp req = do
  case validateSignUp req of
    Left validationError -> return $ Left validationError
    Right req            -> signUpValidated req

signUpValidated :: SignUpRequest -> IO (Either Text AuthResponse)
signUpValidated req = do
  Right users <- executeQuery $ userByEmail (email req)
  case safeHead users of
    Just _  -> return $ Left "User already exists."
    Nothing -> registerNewUser req

registerNewUser :: SignUpRequest -> IO (Either Text AuthResponse)
registerNewUser req = do
  hashedPass <- hashPassword $ mkPassword (password req)
  uuid <- nextRandom
  let user =
        U.User
          { U.id = uuid
          , U.email = email req
          , U.passwordHash = unPasswordHash hashedPass
          , U.firstName = firstName req
          , U.lastName = lastName req
          , U.profilePictureUrl = Nothing
          , U.color = color req
          , U.endColor = Nothing
          , U.authProviderType = IVY
          , U.testUser = False
          }
  insertUserResult <- executeQuery $ insertUser user
  case insertUserResult of
    Left _  -> return $ Left "Failed to register user."
    Right _ -> initSession user (fcmToken req)

initSession :: User -> Maybe Text -> IO (Either Text AuthResponse)
initSession user fcmToken = undefined
