defmodule SituationRoom.Repo.Migrations.CreateNetworkInformations do
  use Ecto.Migration

  def change do
    create table(:network_informations) do
      add :chain_id, :integer
      add :currency_symbol, :string
      add :name, :string
      add :rpc_endpoint, :string
      add :rpc_backup_endpoint, :string
      add :wss_endpoint, :string
      add :wss_backup_endpoint, :string

      timestamps()
    end
  end
end
