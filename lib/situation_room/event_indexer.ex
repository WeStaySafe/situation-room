defmodule SituationRoom.EventIndexer do
  alias SituationRoom.Chains
  alias SituationRoom.Chains.NetworkInformation

  def index() do
    network_informations = Chains.list_network_informations_with_monitors()

    Enum.map(network_informations, fn network_information ->
      {:ok, latest_block_number} = get_latest_block_number(network_information)

      Enum.map(network_information.contract_monitors, fn contract_monitor ->
        # temporary hack, needs to be finegrained
        previous_block_number =
          String.to_integer(String.trim_leading(latest_block_number, "0x"), 16)
          |> Kernel.-(216_000)
          |> Integer.to_string(16)
          |> String.replace_prefix("", "0x")

        {:ok, logs} =
          get_logs_from_contract(
            network_information.rpc_endpoint,
            contract_monitor,
            previous_block_number,
            latest_block_number
          )

        if(not is_nil(logs) and not Enum.empty?(logs)) do
          # TODO: needs refactor, but works for now for the hackathon
          Enum.map(logs, fn log ->
            try do
              SituationRoom.Transactions.create_log(%{
                contract_monitor_id: contract_monitor.id,
                block_number: log["blockNumber"],
                transaction_hash: log["transactionHash"],
                transaction_log_data: log["data"],
                topic: hd(log["topics"]),
                initiator_address:
                  String.replace_prefix(
                    hd(tl(log["topics"])),
                    "0x000000000000000000000000",
                    "0x"
                  )
              })
            rescue
              e in Ecto.ConstraintError ->
                IO.inspect(e)
            end
          end)
        end
      end)
    end)
  end

  defp get_latest_block_number(%NetworkInformation{rpc_endpoint: rpc_endpoint, chain_id: chain_id}) do
    payload = %{
      "jsonrpc" => "2.0",
      "id" => chain_id,
      "method" => "eth_blockNumber",
      "params" => []
    }

    case Req.post(url: rpc_endpoint, json: payload) do
      {:ok, response} ->
        body = response |> Map.get(:body)
        block_number_hex = body["result"]

        # Convert hex to integer
        # block_number = String.to_integer(String.trim_leading(block_number_hex, "0x"), 16)
        {:ok, block_number_hex}

      {:error, error} ->
        {:error, error}
    end
  end

  defp get_logs_from_contract(
         rpc_endpoint,
         contract_monitor,
         previous_block_number,
         latest_block_number
       ) do
    payload = %{
      "jsonrpc" => "2.0",
      "id" => contract_monitor.chain_id,
      "method" => "eth_getLogs",
      "params" => [
        %{
          "address" => contract_monitor.contract_address,
          "fromBlock" => previous_block_number,
          "toBlock" => latest_block_number
        }
      ]
    }

    case Req.post(url: rpc_endpoint, json: payload) do
      {:ok, response} ->
        body = response |> Map.get(:body)
        {:ok, body["result"]}

      {:error, error} ->
        {:error, error}
    end
  end
end

# curl -H "content-type: application/json" -X POST "https://sepolia.mode.network" --data '{"id":0,"jsonrpc":"2.0","method":"eth_getLogs","params":[{"address":"0x5b1c3e19c766732b5f8446025bacd897ac10be4c","paging_options":{"logIndex":"3D","blockNumber":"6423AC"},"fromBlock":"earliest","toBlock":"latest"}]}'
