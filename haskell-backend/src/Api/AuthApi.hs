{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PolyKinds         #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE TypeOperators     #-}

module Api.AuthApi where

import           Api.TransactionsApi
import           Control.Monad            (guard)
import           Control.Monad.IO.Class
import           Data.Aeson
import           Data.Proxy
import           Data.Text
import           GHC.Generics
import           Logic.Data.User          hiding (email, firstName)
import           Logic.Validation
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
signUpValidated req = undefined
  
