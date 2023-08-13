# Situation Room

Monitor/Decision making crises center for smart contracts

### Roadmap

#### Sunday
- [x] Setup westaysafe.com
  - [x] Setup postgres on neon.tech
  - [x] Setup redis on upstash (created a redis db, but didn't make it available yet in code -> only if needed)
  - [x] Setup phoenix project on fly
  - [x] Setup domain westaysafe.com pointing to fly

#### Monday
- [x] Favicon
- [x] Tailwind setup 
- [x] Install setup Oban 
- [x] Create data model with generators
- [x] Create routes with generators

#### Tuesday
- [x] Create sign in flow 

#### Wednesday (short day)

- [x] Styling

### Thursday
- [x] Register chains (through ssh to machine and use context)

#### Friday (short day)
- [x] Route chains chain_id
- [x] Network switcher

#### Saterday
- [x] Create contract Foundry (https://github.com/WeStaySafe/blueprint_contract)
  - [x] Delay
  - [x] Block
  - [x] Circuit Breaker
  - [x] Deploy to testnet Chains 
    - Optimism Goerli
      - 0x5B1c3E19C766732B5f8446025baCd897aC10be4C 
    - Mode Sepolia 
      - 0x5B1c3E19C766732B5f8446025baCd897aC10be4C
    - Zora Goerli
      - 0x5D237030445C8A5b9868e7C399E0CBa48a436662
    - Base Goerli
      - 0x5D237030445C8A5b9868e7C399E0CBa48a436662
- [x] Register contract
- [x] Smart Contract event/log monitor/indexer
  - [x] Cronjob with quantum checking if we caught all the logs/events from the registered contracts

#### Sunday Demo
- [x] Improvements
- [x] Video recorded

