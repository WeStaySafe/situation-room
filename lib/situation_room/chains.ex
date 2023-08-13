defmodule SituationRoom.Chains do
  @moduledoc """
  The Chains context.
  """

  import Ecto.Query, warn: false
  alias SituationRoom.Repo

  alias SituationRoom.Chains.NetworkInformation

  @doc """
  Returns the list of network_informations.

  ## Examples

      iex> list_network_informations()
      [%NetworkInformation{}, ...]

  """
  def list_network_informations do
    Repo.all(NetworkInformation)
  end

  @doc """
  Returns the list of network_informations with nested smart contract monitors.

  ## Examples

      iex> list_network_informations_with_monitors()
      [%NetworkInformation{}, ...]

  """
  def list_network_informations_with_monitors do
    query = from ni in NetworkInformation,
      select: ni,
      preload: [:contract_monitors]

    Repo.all(query)
  end

  @doc """
  Gets a single network_information.

  Raises `Ecto.NoResultsError` if the Network information does not exist.

  ## Examples

      iex> get_network_information!(123)
      %NetworkInformation{}

      iex> get_network_information!(456)
      ** (Ecto.NoResultsError)

  """
  def get_network_information!(chain_id), do: Repo.get!(NetworkInformation, chain_id)

  @doc """
  Creates a network_information.

  ## Examples

      iex> create_network_information(%{field: value})
      {:ok, %NetworkInformation{}}

      iex> create_network_information(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_network_information(attrs \\ %{}) do
    %NetworkInformation{}
    |> NetworkInformation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a network_information.

  ## Examples

      iex> update_network_information(network_information, %{field: new_value})
      {:ok, %NetworkInformation{}}

      iex> update_network_information(network_information, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_network_information(%NetworkInformation{} = network_information, attrs) do
    network_information
    |> NetworkInformation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a network_information.

  ## Examples

      iex> delete_network_information(network_information)
      {:ok, %NetworkInformation{}}

      iex> delete_network_information(network_information)
      {:error, %Ecto.Changeset{}}

  """
  def delete_network_information(%NetworkInformation{} = network_information) do
    Repo.delete(network_information)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking network_information changes.

  ## Examples

      iex> change_network_information(network_information)
      %Ecto.Changeset{data: %NetworkInformation{}}

  """
  def change_network_information(%NetworkInformation{} = network_information, attrs \\ %{}) do
    NetworkInformation.changeset(network_information, attrs)
  end

  alias SituationRoom.Chains.ContractMonitor

  @doc """
  Returns the list of contract_monitors.

  ## Examples

      iex> list_contract_monitors()
      [%ContractMonitor{}, ...]

  """
  def list_contract_monitors do
    Repo.all(ContractMonitor)
  end

  @doc """
  Returns the list of contract_monitors by chain_id.

  ## Examples

      iex> list_contract_monitors_by_chain_id()
      [%ContractMonitor{}, ...]

  """
  def list_contract_monitors_by_chain_id(chain_id) do
    query = from cm in ContractMonitor,
      where: cm.chain_id == ^chain_id,
      select: cm

    Repo.all(query)
  end

  @doc """
  Gets a single contract_monitor.

  Raises `Ecto.NoResultsError` if the Contract monitor does not exist.

  ## Examples

      iex> get_contract_monitor!(123)
      %ContractMonitor{}

      iex> get_contract_monitor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_contract_monitor!(id), do: Repo.get!(ContractMonitor, id)

  @doc """
  Creates a contract_monitor.

  ## Examples

      iex> create_contract_monitor(%{field: value})
      {:ok, %ContractMonitor{}}

      iex> create_contract_monitor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_contract_monitor(attrs \\ %{}) do
    %ContractMonitor{}
    |> ContractMonitor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a contract_monitor.

  ## Examples

      iex> update_contract_monitor(contract_monitor, %{field: new_value})
      {:ok, %ContractMonitor{}}

      iex> update_contract_monitor(contract_monitor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_contract_monitor(%ContractMonitor{} = contract_monitor, attrs) do
    contract_monitor
    |> ContractMonitor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a contract_monitor.

  ## Examples

      iex> delete_contract_monitor(contract_monitor)
      {:ok, %ContractMonitor{}}

      iex> delete_contract_monitor(contract_monitor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_contract_monitor(%ContractMonitor{} = contract_monitor) do
    Repo.delete(contract_monitor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking contract_monitor changes.

  ## Examples

      iex> change_contract_monitor(contract_monitor)
      %Ecto.Changeset{data: %ContractMonitor{}}

  """
  def change_contract_monitor(%ContractMonitor{} = contract_monitor, attrs \\ %{}) do
    ContractMonitor.changeset(contract_monitor, attrs)
  end
end
