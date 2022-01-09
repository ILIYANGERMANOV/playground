module PlutusUtils(
  walletPubKeyHash,
  slotToTime
) where

import Ledger
import Wallet.Emulator
import Data.Default
import Ledger.TimeSlot
import Data.Void                  (Void)
import Data.Aeson            (FromJSON, ToJSON)
import Data.Functor          (void)
import Data.Text             (Text, unpack)
import GHC.Generics          (Generic)
import Ledger.Ada            as Ada
import Ledger.Constraints    as Constraints
import Plutus.Contract       as Contract
import Plutus.Trace.Emulator as Emulator
import Wallet.Emulator.Wallet
import Control.Monad.Freer.Extras as Extras
import Wallet.Emulator.Wallet
import Ledger.TimeSlot

walletPubKeyHash :: Integer -> PubKeyHash
walletPubKeyHash w = pubKeyHash . walletPubKey . Wallet $ w

slotToTime :: Slot -> POSIXTime
slotToTime n = slotToBeginPOSIXTime def n

-------------- On-chain --------------------
-- Inline pragme so on-chain code can be compiled to Plutus
{-# INLINABLE mkValidator #-}

-------------- On-chain --------------------

-------------- Repl -----------------
:set -XOverloadedStrings
-------------- Repl -----------------

-------------------  Emulator -----------
-- Wait 1 slot in Emulator Traces
void $ Emulator.waitNSlots 1
-------------------  Emulator -----------

-------------------  Contract -----------
-- Retrieve own PubKey
pk <- Contract.ownPubKey
let pkh = pubKeyHask pk
-- or shortened
pkh <- pubKeyHash <$> Contract.ownPubKey

-- Log from contract
Contract.logInfo @String "hello from the contract"

-- Handle error in Contract
Contract.handleError (\err -> Contract.logError $ "caught: " ++ unpack err) (void $ submitTx tx)
-------------------  Contract -----------
