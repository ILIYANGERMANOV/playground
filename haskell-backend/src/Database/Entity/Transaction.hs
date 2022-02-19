{-# LANGUAGE BlockArguments        #-}
{-# LANGUAGE DeriveAnyClass        #-}
{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE RankNTypes            #-}
{-# LANGUAGE StandaloneDeriving    #-}
{-# LANGUAGE TypeFamilies          #-}

module Database.Entity.Transaction where

import           Data.Text        (Text)
import           Database.DbCore
import           GHC.Generics     (Generic)
import           Hasql.Connection as Connection
import           Hasql.Session
import           Hasql.Statement
import           Prelude
import           Rel8

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

allTransactions :: Statement () [Transaction Result]
allTransactions = select $ each transactionSchema
