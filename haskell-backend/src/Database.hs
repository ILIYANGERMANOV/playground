{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}

module Database where

import Data.Text ( Text )
import GHC.Generics ( Generic )
import Rel8
import Prelude
import Hasql.Session
import Hasql.Statement
import Hasql.Connection as Connection

test :: Integer
test = 1

data Transaction f = Transaction
  { trnId :: Column f Text,
    trnTitle :: Column f (Maybe Text)
  }
  deriving stock (Generic)
  deriving anyclass (Rel8able)

deriving stock instance f ~ Result => Show (Transaction f)

transactionSchema :: TableSchema (Transaction Name)
transactionSchema =
  TableSchema
    { name = "wallet_transactions",
      schema = Nothing,
      columns =
        Transaction
          { trnId = "id",
            trnTitle = "title"
          }
    }

connectionSettings :: Connection.Settings
connectionSettings = Connection.settings "localhost" 5432 "iliyan" "pass" "ivy-local"

execute :: Statement () [Transaction Result] -> IO (Either QueryError  [Transaction Result])
execute stm = do
    Right conn <- acquire connectionSettings
    let preparedStm = statement () stm
    result <- run preparedStm conn
    return result

allTrns :: Statement () [Transaction Result]
allTrns = select $ each transactionSchema

