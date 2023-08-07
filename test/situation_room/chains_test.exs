defmodule SituationRoom.ChainsTest do
  use SituationRoom.DataCase

  alias SituationRoom.Chains

  describe "network_informations" do
    alias SituationRoom.Chains.NetworkInformation

    import SituationRoom.ChainsFixtures

    @invalid_attrs %{chain_id: nil, currency_symbol: nil, name: nil, rpc_backup_endpoint: nil, rpc_endpoint: nil, wss_backup_endpoint: nil, wss_endpoint: nil}

    test "list_network_informations/0 returns all network_informations" do
      network_information = network_information_fixture()
      assert Chains.list_network_informations() == [network_information]
    end

    test "get_network_information!/1 returns the network_information with given id" do
      network_information = network_information_fixture()
      assert Chains.get_network_information!(network_information.id) == network_information
    end

    test "create_network_information/1 with valid data creates a network_information" do
      valid_attrs = %{chain_id: 42, currency_symbol: "some currency_symbol", name: "some name", rpc_backup_endpoint: "some rpc_backup_endpoint", rpc_endpoint: "some rpc_endpoint", wss_backup_endpoint: "some wss_backup_endpoint", wss_endpoint: "some wss_endpoint"}

      assert {:ok, %NetworkInformation{} = network_information} = Chains.create_network_information(valid_attrs)
      assert network_information.chain_id == 42
      assert network_information.currency_symbol == "some currency_symbol"
      assert network_information.name == "some name"
      assert network_information.rpc_backup_endpoint == "some rpc_backup_endpoint"
      assert network_information.rpc_endpoint == "some rpc_endpoint"
      assert network_information.wss_backup_endpoint == "some wss_backup_endpoint"
      assert network_information.wss_endpoint == "some wss_endpoint"
    end

    test "create_network_information/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chains.create_network_information(@invalid_attrs)
    end

    test "update_network_information/2 with valid data updates the network_information" do
      network_information = network_information_fixture()
      update_attrs = %{chain_id: 43, currency_symbol: "some updated currency_symbol", name: "some updated name", rpc_backup_endpoint: "some updated rpc_backup_endpoint", rpc_endpoint: "some updated rpc_endpoint", wss_backup_endpoint: "some updated wss_backup_endpoint", wss_endpoint: "some updated wss_endpoint"}

      assert {:ok, %NetworkInformation{} = network_information} = Chains.update_network_information(network_information, update_attrs)
      assert network_information.chain_id == 43
      assert network_information.currency_symbol == "some updated currency_symbol"
      assert network_information.name == "some updated name"
      assert network_information.rpc_backup_endpoint == "some updated rpc_backup_endpoint"
      assert network_information.rpc_endpoint == "some updated rpc_endpoint"
      assert network_information.wss_backup_endpoint == "some updated wss_backup_endpoint"
      assert network_information.wss_endpoint == "some updated wss_endpoint"
    end

    test "update_network_information/2 with invalid data returns error changeset" do
      network_information = network_information_fixture()
      assert {:error, %Ecto.Changeset{}} = Chains.update_network_information(network_information, @invalid_attrs)
      assert network_information == Chains.get_network_information!(network_information.id)
    end

    test "delete_network_information/1 deletes the network_information" do
      network_information = network_information_fixture()
      assert {:ok, %NetworkInformation{}} = Chains.delete_network_information(network_information)
      assert_raise Ecto.NoResultsError, fn -> Chains.get_network_information!(network_information.id) end
    end

    test "change_network_information/1 returns a network_information changeset" do
      network_information = network_information_fixture()
      assert %Ecto.Changeset{} = Chains.change_network_information(network_information)
    end
  end
end
