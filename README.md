> **👋 We are looking for unlaunched projects that want to use this software from the start when building and safeguarding their community!👋**

# 🤝 WeStaySafe - Situation Room

WeStaySafe Situation room is a monitoring/intervention security platform. The community can check and block malicious smart contract transactions. As last resort the community can even circuit break the protocol. So how do we do this:

1. We have a real-time dashboard to see all incoming transactions
2, These transactions are time-delayed and this gives the community the chance to block them if they are malicious against the protocol
3. In case of a serious hack (with many malicious transactions) the community can circuit break the protocol 
4. If the transaction time-delay is over the transaction initiator can withdraw their funds (if the protocol is not circuit-breaker mode)

![WeStaySafe Dashboard](https://westaysafe.com/images/screenshot-situation-room.jpg)

## 🤓 Features 

- Easy to add your chain(s) network information
- Easy to add contract monitors
- Real-time dashboard for monitoring transactions
- Indexer for contract logs
- Notification alerts for your community (WIP)

## 🚀 How to deploy 

1. Clone/Fork repository
2. Create a fly.io account
3. Run the following command from the root: `fly launch`

## 💻 Prerequisites for running this locally 
- Elixir should be installed, if not check: https://elixir-lang.org/install.html
- Phoenix should be installed, if not check: https://hexdocs.pm/phoenix/installation.html
- NodeJS should be installed, if not check: https://nodejs.org/en/download
- Postgres should be installed if not check
   - for MacOS: https://postgresapp.com/ 
   - for Windows: https://www.postgresql.org/download/windows/
   - for Linux: https://www.postgresql.org/download/

### 🔧 Install (and setup/migrate local database)

```
mix setup 
```

### 💻 Run the software locally 

```
mix phx.server
```

### 💻 Run the software locally with Elixir REPL 

```
iex -S mix phx.server
```

## 🦸‍♂️ Contributing 

If you have any suggestions/improvements/feedback that is great! Create an issue, a pull request or whatever you prefer! 

