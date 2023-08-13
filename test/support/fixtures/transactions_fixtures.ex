defmodule SituationRoom.TransactionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SituationRoom.Transactions` context.
  """
  alias SituationRoom.ChainsFixtures

  @doc """
  Generate a log.
  """
  def log_fixture(attrs \\ %{}) do
    contract_monitor = SituationRoom.ChainsFixtures.contract_monitor_fixture()

    {:ok, log} =
      attrs
      |> Enum.into(%{
        contract_monitor_id: contract_monitor.id,
        initiator_address: "some initiator_address",
        topic: "some topic",
        transaction_hash: "some transaction_hash",
        transaction_log_data: "some transaction_log_data"
      })
      |> SituationRoom.Transactions.create_log()

    log
  end
end
