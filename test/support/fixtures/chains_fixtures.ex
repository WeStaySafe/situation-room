defmodule SituationRoom.ChainsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SituationRoom.Chains` context.
  """

  @doc """
  Generate a network_information.
  """
  def network_information_fixture(attrs \\ %{}) do
    {:ok, network_information} =
      attrs
      |> Enum.into(%{
        chain_id: 42,
        currency_symbol: "some currency_symbol",
        name: "some name",
        rpc_backup_endpoint: "some rpc_backup_endpoint",
        rpc_endpoint: "some rpc_endpoint",
        wss_backup_endpoint: "some wss_backup_endpoint",
        wss_endpoint: "some wss_endpoint"
      })
      |> SituationRoom.Chains.create_network_information()

    network_information
  end

  @doc """
  Generate a contract_monitor.
  """
  def contract_monitor_fixture(attrs \\ %{}) do
    network_information = network_information_fixture()
    
    {:ok, contract_monitor} =
      attrs
      |> Enum.into(%{
        contract_address: "some contract_address",
        contract_name: "some contract_name",
        contract_origin_url: "some contract_origin_url",
        chain_id: network_information.chain_id
      })
      |> SituationRoom.Chains.create_contract_monitor()

    contract_monitor
  end
end
