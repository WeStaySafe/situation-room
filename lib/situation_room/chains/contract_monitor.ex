defmodule SituationRoom.Chains.ContractMonitor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contract_monitors" do
    field :contract_address, :string
    field :contract_name, :string
    field :contract_origin_url, :string
    field :chain_id, :integer
    timestamps()
  end

  @doc false
  def changeset(contract_monitor, attrs) do
    contract_monitor
    |> cast(attrs, [:contract_address, :contract_name, :contract_origin_url, :chain_id])
    |> validate_required([:contract_address, :contract_name, :contract_origin_url, :chain_id])
    |> unique_constraint([:chain_id, :contract_address])
  end
end
