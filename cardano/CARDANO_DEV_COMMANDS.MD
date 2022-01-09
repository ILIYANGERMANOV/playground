# Useful commands for Cardano Smart Contracts development

## Run Playground
### Run playground server
`cd ~/plutus`
`nix-shell`
`cd plutus-playground-server`
`plutus-playground-server`

### Run playground frontend
`cd ~/plutus`
`nix-shell`
`cd plutus-playground-client`
`npm run start`


## Build & run documentation
### Build documentation
`cd ~/plutus`
`nix-build -A plutus-playground.haddock`
`cd ~plutus/result/share/doc`
`google-chrome index.html` (option 1)
`python3 -m http.server 8081` (option 2)
