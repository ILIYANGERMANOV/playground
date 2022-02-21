{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PolyKinds         #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE TypeOperators     #-}

module Api.TransactionsApi where

import           Control.Monad.IO.Class      (liftIO)
import           Data.Aeson
import           Data.Proxy
import           Data.Text
import           Database.DbCore             (executeQuery)
import           Database.Entity.Transaction
import           GHC.Generics
import           Network.Wai
import           Network.Wai.Handler.Warp    ()
import           Prelude
import           Servant
import           Servant.API.Generic
import           Servant.Server.Generic      ()

type AppM a = IO (Handler a)

data Transaction =
  Transaction
    { trnId     :: Text
    , trnTitle  :: Maybe Text
    , trnAmount :: Double
    }
  deriving (Generic, Show)

instance FromJSON Transaction

instance ToJSON Transaction

getTransactionsH :: Handler (IO [Transaction])
getTransactionsH = return getTransactions

getTransactions :: IO [Transaction]
getTransactions = do
  Right trns <- liftIO $ executeQuery allTransactions
  return $
    Prelude.map
      (\t ->
         Transaction {trnId = _id t, trnTitle = _title t, trnAmount = _amount t})
      trns
