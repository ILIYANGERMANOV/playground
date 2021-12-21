## How to build?

### 1. Install GO

### 2. Install Java

### 3. Install Tendermint

`brew install tendermint --build-from-source`

## How to init

### 1. Run local TrustChain app

`./gradlew run`

### 2. Run local Tendermint node

`tendermint node --abci grpc --proxy-app tcp://127.0.0.1:26658`

## ABCI client

### Commit block

`curl -s 'localhost:26657/broadcast_tx_commit?tx="tendermint=rocks"'`

### Query

`curl -s 'localhost:26657/abci_query?data="tendermint"'`