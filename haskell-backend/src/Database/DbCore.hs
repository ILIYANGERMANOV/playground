{-# LANGUAGE BlockArguments        #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE RankNTypes            #-}
{-# LANGUAGE TypeFamilies          #-}

module Database.DbCore where

import           Data.Text        (Text)
import           GHC.Generics     (Generic)
import           Hasql.Connection as Connection
import           Hasql.Session
import           Hasql.Statement
import           Prelude
import           Rel8

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

executeQuery :: Statement () a -> IO (Either QueryError a)
executeQuery stm = do
  conn <- connectToDb
  let preparedStm = statement () stm
  run preparedStm conn
