{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PolyKinds         #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE TypeOperators     #-}

module Server where

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
import Api.TransactionsApi
import Control.Monad.IO.Class


-- | A greet message data type
newtype Greet = Greet {
    _msg :: Text
  }
  deriving (Generic, Show)

instance FromJSON Greet
instance ToJSON Greet


data Person =
  Person
    { name :: Text
    , age  :: Int
    }
  deriving (Generic, Show)

instance FromJSON Person
instance ToJSON Person


-- API specification
type TestApi
       -- GET /hello/:name?capital={true, false}  returns a Greet as JSON
   = "hello" :> Capture "name" Text :> QueryParam "capital" Bool :> Get '[ JSON] Greet
       -- POST /greet with a Greet as JSON in the request body,
       --             returns a Greet as JSON
      :<|> "greet" :> ReqBody '[ JSON] Greet :> Post '[ JSON] Greet
       -- DELETE /greet/:greetid
      :<|> "greet" :> Capture "greetid" Text :> Delete '[ JSON] NoContent
      :<|> "person" :> Get '[ JSON] Person
      :<|> "transactions" :> Get '[ JSON] [Transaction]

testApi :: Proxy TestApi
testApi = Proxy

-- Server-side handlers.
--
-- There's one handler per endpoint, which, just like in the type
-- that represents the API, are glued together using :<|>.
--
-- Each handler runs in the 'Handler' monad.
server :: Server TestApi
server = helloH :<|> postGreetH :<|> deleteGreetH :<|> personH :<|> transactionsH
  where
    helloH :: Text -> Maybe Bool -> Handler Greet
    helloH name Nothing      = helloH name (Just False)
    helloH name (Just False) = return . Greet $ "Hello, " <> name
    helloH name (Just True)  = return . Greet . toUpper $ "Hello, " <> name

    postGreetH :: Greet -> Handler Greet
    postGreetH greet = return greet

    deleteGreetH _ = return NoContent

personH :: Handler Person
personH = return $ Person "Iliyan" 25

transactionsH :: Handler [Transaction]
transactionsH = liftIO getTransactions

-- Turn the server into a WAI app. 'serve' is provided by servant,
-- more precisely by the Servant.Server module.
test :: Application
test = serve testApi server

-- Run the server.
--
-- 'run' comes from Network.Wai.Handler.Warp
runTestServer :: Port -> IO ()
runTestServer port = run port test

-- Put this all to work!
main :: IO ()
main = runTestServer 8001
