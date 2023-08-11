defmodule SituationRoomWeb.ContractMonitorLive.Show do
  use SituationRoomWeb, :live_view

  alias SituationRoom.Chains

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id, "chain_id" => chain_id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:chain_id, chain_id)
     |> assign(:contract_monitor, Chains.get_contract_monitor!(id))}
  end

  defp page_title(:show), do: "Show Contract monitor"
  defp page_title(:edit), do: "Edit Contract monitor"
end
