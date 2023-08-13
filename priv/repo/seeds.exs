# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SituationRoom.Repo.insert!(%SituationRoom.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Optimism Mainnet and testnet Goerli
SituationRoom.Repo.insert!(%SituationRoom.Chains.NetworkInformation{
  :chain_id => 10,
  :currency_symbol => "ETH",
  :name => "optimism",
  :block_explorer => "https://optimistic.etherscan.io",
  # Only for testing
  :rpc_endpoint => "https://mainnet.optimism.io",
  :wss_endpoint => "wss://mainnet.optimism.io"
})

optimismgoerli = SituationRoom.Repo.insert!(%SituationRoom.Chains.NetworkInformation{
  :chain_id => 420,
  :currency_symbol => "ETH",
  :name => "optimism-goerli",
  :block_explorer => "https://goerli-optimistic.etherscan.io",
  :rpc_endpoint => "https://goerli.optimism.io",
  :wss_endpoint => "wss://goerli.optimism.io"
})

SituationRoom.Repo.insert!(%SituationRoom.Chains.ContractMonitor{
  :contract_address => "0x5B1c3E19C766732B5f8446025baCd897aC10be4C",
  :contract_name => "WeStaySafe Deposit Blueprint",
  :contract_origin_url => "www.westaysafe.com",
  :chain_id => optimismgoerli.chain_id
})


# Zora Mainnet and testnet Goerli
SituationRoom.Repo.insert!(%SituationRoom.Chains.NetworkInformation{
  :chain_id => 7777777,
  :currency_symbol => "ETH",
  :name => "zora",
  :block_explorer => "https://explorer.zora.energy",
  :rpc_endpoint => "https://rpc.zora.energy",
  :wss_endpoint => "wss://rpc.zora.energy"
})

zoragoerli = SituationRoom.Repo.insert!(%SituationRoom.Chains.NetworkInformation{
  :chain_id => 999,
  :currency_symbol => "ETH",
  :name => "zora-goerli",
  :block_explorer => "https://testnet.explorer.zora.energy",
  :rpc_endpoint => "https://testnet.rpc.zora.energy",
  :wss_endpoint => "wss://testnet.rpc.zora.energy"
})

SituationRoom.Repo.insert!(%SituationRoom.Chains.ContractMonitor{
  :contract_address => "0x5D237030445C8A5b9868e7C399E0CBa48a436662",
  :contract_name => "WeStaySafe Deposit Blueprint",
  :contract_origin_url => "www.westaysafe.com",
  :chain_id => zoragoerli.chain_id
})


# Base Mainnet and testnet Goerli
SituationRoom.Repo.insert!(%SituationRoom.Chains.NetworkInformation{
  :chain_id => 8453,
  :currency_symbol => "ETH",
  :name => "base",
  :block_explorer => "https://basescan.org",
  # Only for testing
  :rpc_endpoint => "https://mainnet.base.org",
  :wss_endpoint => "wss://mainnet.base.org"
})

basegoerli = SituationRoom.Repo.insert!(%SituationRoom.Chains.NetworkInformation{
  :chain_id => 84531,
  :currency_symbol => "ETH",
  :name => "base-goerli",
  :block_explorer => "https://goerli.basescan.org",
  :rpc_endpoint => "https://goerli.base.org",
  :wss_endpoint => "wss://goerli.base.org"
})

SituationRoom.Repo.insert!(%SituationRoom.Chains.ContractMonitor{
  :contract_address => "0x5D237030445C8A5b9868e7C399E0CBa48a436662",
  :contract_name => "WeStaySafe Deposit Blueprint",
  :contract_origin_url => "www.westaysafe.com",
  :chain_id => basegoerli.chain_id
})


# Mode testnet
modesepolia = SituationRoom.Repo.insert!(%SituationRoom.Chains.NetworkInformation{
  :chain_id => 919,
  :currency_symbol => "ETH",
  :name => "mode",
  :block_explorer => "https://sepolia.explorer.mode.network/",
  :rpc_endpoint => "https://sepolia.mode.network",
  :wss_endpoint => "wss://sepolia.mode.network"
})

SituationRoom.Repo.insert!(%SituationRoom.Chains.ContractMonitor{
  :contract_address => "0x5B1c3E19C766732B5f8446025baCd897aC10be4C",
  :contract_name => "WeStaySafe Deposit Blueprint",
  :contract_origin_url => "www.westaysafe.com",
  :chain_id => modesepolia.chain_id
})
