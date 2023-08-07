defmodule SituationRoom.Chains.NetworkInformation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "network_informations" do
    field :chain_id, :integer
    field :currency_symbol, :string
    field :name, :string
    field :rpc_backup_endpoint, :string
    field :rpc_endpoint, :string
    field :wss_backup_endpoint, :string
    field :wss_endpoint, :string

    timestamps()
  end

  @doc false
  def changeset(network_information, attrs) do
    network_information
    |> cast(attrs, [:chain_id, :currency_symbol, :name, :rpc_endpoint, :rpc_backup_endpoint, :wss_endpoint, :wss_backup_endpoint])
    |> validate_required([:chain_id, :currency_symbol, :name, :rpc_endpoint, :rpc_backup_endpoint, :wss_endpoint, :wss_backup_endpoint])
  end
end
