defmodule SituationRoom.Repo.Migrations.CreateTransactionLog do
  use Ecto.Migration

  def change do
    create table(:transaction_logs) do
      add :transaction_hash, :string
      add :transaction_log_data, :string
      add :topic, :string
      add :contract_monitor_id, references(:contract_monitors, on_delete: :delete_all)
      add :initiator_address, :string

      timestamps()
    end

    create unique_index(:transaction_logs, [
             :contract_monitor_id,
             :initiator_address,
             :topic,
             :transaction_hash
           ])
  end
end
