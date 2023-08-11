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
- [ ] Create contract Foundry
  - [ ] Delay
  - [ ] Block
  - [ ] Circuit Breaker
- [ ] Register contract flow
- [ ] Smart Contract event/log monitor/indexer
  - [ ] Cronjob with quantum checking if we caught all the logs/events from the registered contracts
- [ ] Voting UI
  - [ ] Liveview voting
  - [ ] Consensus liveview visualisation (https://github.com/mindok/contex ?)

Time left? Try to implement worldcoin again

#### Sunday Demo
- [ ] Show delay flow
- [ ] Show block flow
- [ ] Show circuit breaker flow
