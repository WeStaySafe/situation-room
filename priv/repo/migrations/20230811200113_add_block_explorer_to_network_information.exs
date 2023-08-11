defmodule SituationRoom.Repo.Migrations.AddBlockExplorerToNetworkInformation do
  use Ecto.Migration

  def change do
    alter table(:network_informations) do
      add :block_explorer, :string
    end
  end
end
