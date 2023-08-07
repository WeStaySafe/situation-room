defmodule SituationRoomWeb.ContractMonitorLive.Index do
  use SituationRoomWeb, :live_view

  alias SituationRoom.Chains
  alias SituationRoom.Chains.ContractMonitor

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :contract_monitors, Chains.list_contract_monitors())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Contract monitor")
    |> assign(:contract_monitor, Chains.get_contract_monitor!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Contract monitor")
    |> assign(:contract_monitor, %ContractMonitor{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Contract monitors")
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
