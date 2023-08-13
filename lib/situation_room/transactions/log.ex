defmodule SituationRoom.Transactions.Log do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transaction_logs" do
    field :contract_monitor_id, :integer
    field :initiator_address, :string
    field :topic, :string
    field :transaction_hash, :string
    field :transaction_log_data, :string

    timestamps()
  end

  @doc false
  def changeset(log, attrs) do
    log
    |> cast(attrs, [
      :transaction_hash,
      :transaction_log_data,
      :contract_monitor_id,
      :topic,
      :initiator_address
    ])
    |> validate_required([
      :transaction_hash,
      :transaction_log_data,
      :contract_monitor_id,
      :topic,
      :initiator_address
    ])
  end
end
