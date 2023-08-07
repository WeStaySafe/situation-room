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
- [X] Favicon
- [x] Tailwind setup 
- [X] Install setup Oban 
- [ ] Create data model with generators
- [ ] Create routes with generators

#### Tuesday
- [ ] Create sign in flow 
  - [ ] World app flow (https://hexdocs.pm/openid_connect/readme.html)
  - [ ] Backup strategy?  

### Wednesday/Thursday
- [ ] Register chains (admin only)
- [ ] Register contract flow
  - [ ] With events/logs
  - [ ] Potentially with alerts if time left
- [ ] Smart Contract event/log monitor/indexer
  - [ ] Websocket flow with supervisor if websocket 
  - [ ] Cronjob with quantum checking if we caught all the logs/events from the registered contracts

#### Friday
- [ ] Notifications/alerts
  - [ ] Email first
    - [ ] If someone initiates a transaction delay -> to the transaction initiator
    - [ ] If delay is over without follow up action -> to the transaction initiator
    - [ ] If someone does a transaction block vote -> to all registered/invested protocol members
    - [ ] Result transaction block vote -> to all registered/invested protocol members
    - [ ] If someone does a smart contract/protocol circuit breaker vote -> to all registered/invested protocol members
    - [ ] Result smart contract/protocol circuit breaker vote -> to all registered/invested protocol members

#### Saterday
- [ ] Voting UI
  - [ ] Liveview voting
  - [ ] Consensus liveview visualisation (https://github.com/mindok/contex ?)

#### Sunday Demo
- [ ] Show delay flow
- [ ] Show block flow
- [ ] Show circuit breaker flow
