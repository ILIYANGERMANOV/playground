{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}

module Database
  ( test,
  )
where

import Prelude
import Rel8
import Data.Text
import GHC.Generics

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