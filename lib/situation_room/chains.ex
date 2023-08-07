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
  Gets a single network_information.

  Raises `Ecto.NoResultsError` if the Network information does not exist.

  ## Examples

      iex> get_network_information!(123)
      %NetworkInformation{}

      iex> get_network_information!(456)
      ** (Ecto.NoResultsError)

  """
  def get_network_information!(id), do: Repo.get!(NetworkInformation, id)

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
end
