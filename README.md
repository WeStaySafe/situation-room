> [ETH Global Superhack judges should review this branch!](https://github.com/WeStaySafe/situation-room/tree/eth-global-superhack)

> **👋 We are looking for unlaunched projects that want to use this software from the start when building a community!👋**

# WeStaySafe - Situation Room 🤝

WeStaySafe Situation room is a monitoring/intervention security platform where the community can check/delay and block malicious smart contract transactions or even circuit break the protocol.

We have a real-time dashboard to see all incoming transactions. These transactions are time-delayed and this gives the community the chance to delay/block them if they are malicious against the protocol. 

In case of a serious hack the community has the ability to circuit-break the protocol to prevent the loss of funds/assets. If there is nothing wrong with a transaction it is only time delayed and the community member can withdraw their funds. This will prevent almost all hacks if the smart contract withdrawal code is secure and the community is fast enough to stop the attacker. 

![WeStaySafe Dashboard](https://westaysafe.com/images/screenshot-situation-room.jpg)

## Features 🤓

- Easy to add your chain(s) network information
- Easy to add contract monitors
- Real-time dashboard for monitoring transactions
- Indexer for contract logs
- Notification alerts for your community (WIP)

## How to deploy 🚀

1. Clone/Fork repository
2. Create a fly.io account
3. Run the following command from the root: `fly launch`

## Prerequisites for running this locally 💻
- Elixir should be installed, if not check: https://elixir-lang.org/install.html
- Phoenix should be installed, if not check: https://hexdocs.pm/phoenix/installation.html
- NodeJS should be installed, if not check: https://nodejs.org/en/download
- Postgres should be installed if not check
   - for MacOS: https://postgresapp.com/ 
   - for Windows: https://www.postgresql.org/download/windows/
   - for Linux: https://www.postgresql.org/download/

### Install 🔧

```
mix setup 
```

### Run the software locally 💻

```
mix phx.server
```

### Run the software locally with Elixir REPL 💻

```
iex -S mix phx.server
```

## Contributing 🦸‍♂️🦸‍♀️

If you have any suggestions/improvements/feedback that is great! Create an issue, a pull request or whatever you prefer! 

