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
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TypeFamilies #-}

module Database where

import Prelude
import Data.Text
import GHC.Generics
import qualified Hasql.Session as Session
import qualified Hasql.Connection as Connection
import Rel8

test :: Integer
test = 1

data Transaction f = Transaction
  { 
      trnId       :: Column f Text
    , trnTitle    :: Column f (Maybe Text) 
  }
  deriving stock (Generic)
  deriving anyclass (Rel8able)

deriving stock instance f ~ Result => Show (Transaction f)

transactionSchema :: TableSchema (Transaction Name)
transactionSchema = TableSchema
  { name = "wallet_transactions"
  , schema = Nothing
  , columns = Transaction
      { trnId = "id"
      , trnTitle = "title"
      }
  }


connectionSettings = Connection.settings "localhost" 5432 "iliyan" "pass" "ivy-local"

-- connect = do
--     Right conn <- Connection.acquire connectionSettings
--     trns <- select $ each transactionSchema
--     putStrLn "OK"