defmodule SituationRoomWeb.ContractMonitorLive.Show do
  use SituationRoomWeb, :live_view

  alias SituationRoom.Chains

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(2000, self(), :refresh)

    {:ok, socket |> assign(:current_user, nil)}
  end

  @impl true
  def handle_params(%{"id" => id, "chain_id" => chain_id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:chain_id, chain_id)
     |> assign(:contract_monitor_id, id)
     |> assign(:contract_monitor, Chains.get_contract_monitor_with_logs!(id))}
  end

  defp page_title(:show), do: "Show Contract monitor"
  defp page_title(:edit), do: "Edit Contract monitor"

  @impl true
  def handle_info(:refresh, socket) do
    {:noreply,
     socket
     |> assign(:contract_monitor, Chains.get_contract_monitor_with_logs!(socket.assigns.contract_monitor_id))}
  end
end
