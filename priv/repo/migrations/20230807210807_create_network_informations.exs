defmodule SituationRoom.Repo.Migrations.CreateNetworkInformations do
  use Ecto.Migration

  def change do
    create table(:network_informations, primary_key: false) do
      add :chain_id, :integer, primary_key: true, null: false
      add :currency_symbol, :string
      add :name, :string
      add :rpc_endpoint, :string, null: false
      add :rpc_backup_endpoint, :string
      add :wss_endpoint, :string, null: false
      add :wss_backup_endpoint, :string

      timestamps()
    end

    create unique_index(:network_informations, [:chain_id])
  end
end
