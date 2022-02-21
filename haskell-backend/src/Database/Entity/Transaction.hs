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

data TransactionEntity f =
  TransactionEntity
    { _id     :: Column f Text
    , _title  :: Column f (Maybe Text)
    , _amount :: Column f Double
    }
  deriving (Generic)
  deriving anyclass (Rel8able)

deriving stock instance f ~ Result => Show (TransactionEntity f)

transactionSchema :: TableSchema (TransactionEntity Name)
transactionSchema =
  TableSchema
    { name = "wallet_transactions"
    , schema = Nothing
    , columns =
        TransactionEntity {_id = "id", _title = "title", _amount = "amount"}
    }

allTransactions :: Statement () [TransactionEntity Result]
allTransactions = select $ each transactionSchema
