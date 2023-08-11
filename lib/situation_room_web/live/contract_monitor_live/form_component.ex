defmodule SituationRoomWeb.ContractMonitorLive.FormComponent do
  use SituationRoomWeb, :live_component

  alias SituationRoom.Chains

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage contract_monitor records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="contract_monitor-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:contract_address]} type="text" label="Contract address" />
        <.input field={@form[:contract_name]} type="text" label="Contract name" />
        <.input field={@form[:contract_origin_url]} type="text" label="Contract origin url" />

        <:actions>
          <.button phx-disable-with="Saving...">Save Contract monitor</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{contract_monitor: contract_monitor} = assigns, socket) do
    changeset = Chains.change_contract_monitor(contract_monitor)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"contract_monitor" => contract_monitor_params}, socket) do
    changeset =
      socket.assigns.contract_monitor
      |> Chains.change_contract_monitor(contract_monitor_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"contract_monitor" => contract_monitor_params}, socket) do
    save_contract_monitor(socket, socket.assigns.action, contract_monitor_params)
  end

  defp save_contract_monitor(socket, :edit, contract_monitor_params) do
    case Chains.update_contract_monitor(socket.assigns.contract_monitor, contract_monitor_params) do
      {:ok, contract_monitor} ->
        notify_parent({:saved, contract_monitor})

        {:noreply,
         socket
         |> put_flash(:info, "Contract monitor updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_contract_monitor(socket, :new, contract_monitor_params) do
    case Chains.create_contract_monitor(Map.put(contract_monitor_params, "chain_id", socket.assigns.chain_id)) do
      {:ok, contract_monitor} ->
        notify_parent({:saved, contract_monitor})

        {:noreply,
         socket
         |> put_flash(:info, "Contract monitor created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
