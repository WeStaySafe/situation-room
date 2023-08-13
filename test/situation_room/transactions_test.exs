defmodule SituationRoom.TransactionsTest do
  use SituationRoom.DataCase

  alias SituationRoom.Transactions

  describe "transaction_log" do
    alias SituationRoom.Transactions.Log

    import SituationRoom.TransactionsFixtures
    import SituationRoom.ChainsFixtures

    @invalid_attrs %{
      contract_monitor_id: nil,
      initiator_address: nil,
      topic: nil,
      transaction_hash: nil,
      transaction_log_data: nil
    }

    test "list_transaction_log/0 returns all transaction_log" do
      log = log_fixture()
      assert Transactions.list_transaction_log() == [log]
    end

    test "get_log!/1 returns the log with given id" do
      log = log_fixture()
      assert Transactions.get_log!(log.id) == log
    end

    test "create_log/1 with valid data creates a log" do
      contract_monitor = contract_monitor_fixture()

      valid_attrs = %{
        contract_monitor_id: contract_monitor.id,
        initiator_address: "some initiator_address",
        topic: "some topic",
        transaction_hash: "some transaction_hash",
        transaction_log_data: "some transaction_log_data"
      }

      assert {:ok, %Log{} = log} = Transactions.create_log(valid_attrs)
      assert log.contract_monitor_id == contract_monitor.id
      assert log.initiator_address == "some initiator_address"
      assert log.topic == "some topic"
      assert log.transaction_hash == "some transaction_hash"
      assert log.transaction_log_data == "some transaction_log_data"
    end

    test "create_log/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transactions.create_log(@invalid_attrs)
    end

    test "update_log/2 with valid data updates the log" do
      log = log_fixture()

      update_attrs = %{
        contract_monitor_id: log.contract_monitor_id,
        initiator_address: "some updated initiator_address",
        topic: "some updated topic",
        transaction_hash: "some updated transaction_hash",
        transaction_log_data: "some updated transaction_log_data"
      }

      assert {:ok, %Log{} = log} = Transactions.update_log(log, update_attrs)
      assert log.contract_monitor_id == log.contract_monitor_id
      assert log.initiator_address == "some updated initiator_address"
      assert log.topic == "some updated topic"
      assert log.transaction_hash == "some updated transaction_hash"
      assert log.transaction_log_data == "some updated transaction_log_data"
    end

    test "update_log/2 with invalid data returns error changeset" do
      log = log_fixture()
      assert {:error, %Ecto.Changeset{}} = Transactions.update_log(log, @invalid_attrs)
      assert log == Transactions.get_log!(log.id)
    end

    test "delete_log/1 deletes the log" do
      log = log_fixture()
      assert {:ok, %Log{}} = Transactions.delete_log(log)
      assert_raise Ecto.NoResultsError, fn -> Transactions.get_log!(log.id) end
    end

    test "change_log/1 returns a log changeset" do
      log = log_fixture()
      assert %Ecto.Changeset{} = Transactions.change_log(log)
    end
  end
end
