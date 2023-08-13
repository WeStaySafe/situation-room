defmodule SituationRoomWeb.ContractMonitorLive.Index do
  use SituationRoomWeb, :live_view

  alias SituationRoom.Chains
  alias SituationRoom.Chains.ContractMonitor

  @impl true
  def mount(_params = %{"chain_id" => chain_id}, _session, socket) do
    socket = socket
    |> assign(:chain_id, chain_id)
    |> assign(:current_user, nil)

    {:ok, stream(socket, :contract_monitors, Chains.list_contract_monitors())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id, "chain_id" => chain_id}) do
    socket
    |> assign(:page_title, "Edit Contract monitor")
    |> assign(:chain_id, chain_id)
    |> assign(:contract_monitor, Chains.get_contract_monitor!(id))
  end

  defp apply_action(socket, :new, %{"chain_id" => chain_id}) do
    socket
    |> assign(:page_title, "New Contract monitor")
    |> assign(:chain_id, chain_id)
    |> assign(:contract_monitor, %ContractMonitor{})
  end

  defp apply_action(socket, :index, %{"chain_id" => chain_id}) do
    socket
    |> assign(:page_title, "Listing Contract monitors")
    |> assign(:chain_id, chain_id)
    |> assign(:contract_monitor, nil)
  end

  @impl true
  def handle_info({SituationRoomWeb.ContractMonitorLive.FormComponent, {:saved, contract_monitor}}, socket) do
    {:noreply, stream_insert(socket, :contract_monitors, contract_monitor)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    contract_monitor = Chains.get_contract_monitor!(id)
    {:ok, _} = Chains.delete_contract_monitor(contract_monitor)

    {:noreply, stream_delete(socket, :contract_monitors, contract_monitor)}
  end
end
