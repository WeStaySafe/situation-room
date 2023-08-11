defmodule SituationRoom.Chains.NetworkInformation do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:chain_id, :integer, autogenerate: false}
  schema "network_informations" do
    field :currency_symbol, :string
    field :name, :string
    field :block_explorer, :string
    field :rpc_endpoint, :string
    field :rpc_backup_endpoint, :string
    field :wss_endpoint, :string
    field :wss_backup_endpoint, :string

    has_many :contract_monitors, SituationRoom.Chains.ContractMonitor, foreign_key: :chain_id
    timestamps()
  end

  @doc false
  def changeset(network_information, attrs) do
    network_information
    |> cast(attrs, [:chain_id, :currency_symbol, :name, :block_explorer, :rpc_endpoint, :rpc_backup_endpoint, :wss_endpoint, :wss_backup_endpoint])
    |> validate_required([:chain_id, :currency_symbol, :name, :block_explorer, :rpc_endpoint, :wss_endpoint])
    |> unique_constraint(:chain_id)
  end
end
