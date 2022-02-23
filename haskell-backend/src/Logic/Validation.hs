{-# LANGUAGE OverloadedStrings #-}

module Logic.Validation where

import           Data.Text

notBlank :: Text -> Bool
notBlank = Data.Text.any (/= ' ')

blank :: Text -> Bool
blank = not . notBlank

msgCannotBeBlank :: Text -> Text
msgCannotBeBlank a = Data.Text.concat ["\"", a, "\" cannot be blank."]
