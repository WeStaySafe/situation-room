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
- [ ] World app flow (Can't get it to work unfortunately, if time left try to implement it on profile page)

#### Wednesday (short day)

- [x] Styling

### Thursday
- [x] Register chains (through ssh to machine and use context)
- [ ] Register contract flow
  - [ ] With events/logs
  - [ ] Potentially with alerts if time left
- [ ] Smart Contract event/log monitor/indexer
  - [ ] Websocket flow with supervisor if websocket 
  - [ ] Cronjob with quantum checking if we caught all the logs/events from the registered contracts

#### Friday (short day)
- [ ] Voting UI
  - [ ] Liveview voting
  - [ ] Consensus liveview visualisation (https://github.com/mindok/contex ?)

#### Saterday
- [ ] Create contract
Time left? Try to implement worldcoin again

#### Sunday Demo
- [ ] Show delay flow
- [ ] Show block flow
- [ ] Show circuit breaker flow
