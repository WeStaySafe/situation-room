defmodule SituationRoom.Repo.Migrations.CreateContractMonitors do
  use Ecto.Migration

  def change do
    create table(:contract_monitors) do
      add :contract_address, :string
      add :contract_name, :string
      add :contract_origin_url, :string
      add :chain_id, references(:network_informations, with: [chain_id: :chain_id], on_delete: :delete_all)
      timestamps()
    end

    create unique_index(:contract_monitors, [:chain_id, :contract_address])
  end
end
