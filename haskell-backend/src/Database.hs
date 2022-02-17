{-# LANGUAGE BlockArguments        #-}
{-# LANGUAGE DeriveAnyClass        #-}
{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE RankNTypes            #-}
{-# LANGUAGE StandaloneDeriving    #-}
{-# LANGUAGE TypeFamilies          #-}

module Database where

import           Data.Text        (Text)
import           GHC.Generics     (Generic)
import           Hasql.Connection as Connection
import           Hasql.Session
import           Hasql.Statement
import           Prelude
import           Rel8

test :: Integer
test = 1

data Transaction f =
  Transaction
    { trnId     :: Column f Text
    , trnTitle  :: Column f (Maybe Text)
    , trnAmount :: Column f Double
    }
  deriving (Generic)
  deriving anyclass (Rel8able)

deriving stock instance f ~ Result => Show (Transaction f)

transactionSchema :: TableSchema (Transaction Name)
transactionSchema =
  TableSchema
    { name = "wallet_transactions"
    , schema = Nothing
    , columns =
        Transaction {trnId = "id", trnTitle = "title", trnAmount = "amount"}
    }

connectionSettings :: Connection.Settings
connectionSettings =
  Connection.settings
    "localhost"
    5432
    "iliyan"
    "localivydbpassSECUR3"
    "ivy-local"

connectToDb :: IO Connection
connectToDb = do
  Right conn <- acquire connectionSettings
  return conn

execute :: Statement () a -> IO (Either QueryError a)
execute stm = do
  conn <- connectToDb
  let preparedStm = statement () stm
  run preparedStm conn

allTrns :: Statement () [Transaction Result]
allTrns = select $ each transactionSchema
