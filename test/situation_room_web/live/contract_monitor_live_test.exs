defmodule SituationRoomWeb.ContractMonitorLiveTest do
  use SituationRoomWeb.ConnCase

  import Phoenix.LiveViewTest
  import SituationRoom.ChainsFixtures

  @create_attrs %{contract_address: "some new contract_address", contract_name: "some contract_name", contract_origin_url: "some contract_origin_url", chain_id: 42}
  @update_attrs %{contract_address: "some updated contract_address", contract_name: "some updated contract_name", contract_origin_url: "some updated contract_origin_url", chain_id: 42}
  @invalid_attrs %{contract_address: nil, contract_name: nil, contract_origin_url: nil, chain_id: nil}

  defp create_contract_monitor(_) do
    contract_monitor = contract_monitor_fixture()
    %{contract_monitor: contract_monitor}
  end

  describe "Index" do
    setup [:create_contract_monitor]

    test "lists all contract_monitors", %{conn: conn, contract_monitor: contract_monitor} do
      {:ok, _index_live, html} = live(conn, ~p"/contract_monitors")

      assert html =~ "Listing Contract monitors"
      assert html =~ contract_monitor.contract_address
    end

    test "saves new contract_monitor", %{conn: conn, contract_monitor: contract_monitor} do
      {:ok, index_live, _html} = live(conn, ~p"/contract_monitors")

      assert index_live |> element("a", "New Contract monitor") |> render_click() =~
               "New Contract monitor"

      assert_patch(index_live, ~p"/contract_monitors/new")

      assert index_live
             |> form("#contract_monitor-form", contract_monitor: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#contract_monitor-form", contract_monitor: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/contract_monitors")

      html = render(index_live)
      assert html =~ "Contract monitor created successfully"
      assert html =~ "some contract_address"
    end

    test "updates contract_monitor in listing", %{conn: conn, contract_monitor: contract_monitor} do
      {:ok, index_live, _html} = live(conn, ~p"/contract_monitors")

      assert index_live |> element("#contract_monitors-#{contract_monitor.id} a", "Edit") |> render_click() =~
               "Edit Contract monitor"

      assert_patch(index_live, ~p"/contract_monitors/#{contract_monitor}/edit")

      assert index_live
             |> form("#contract_monitor-form", contract_monitor: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#contract_monitor-form", contract_monitor: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/contract_monitors")

      html = render(index_live)
      assert html =~ "Contract monitor updated successfully"
      assert html =~ "some updated contract_address"
    end

    test "deletes contract_monitor in listing", %{conn: conn, contract_monitor: contract_monitor} do
      {:ok, index_live, _html} = live(conn, ~p"/contract_monitors")

      assert index_live |> element("#contract_monitors-#{contract_monitor.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#contract_monitors-#{contract_monitor.id}")
    end
  end

  describe "Show" do
    setup [:create_contract_monitor]

    test "displays contract_monitor", %{conn: conn, contract_monitor: contract_monitor} do
      {:ok, _show_live, html} = live(conn, ~p"/contract_monitors/#{contract_monitor}")

      assert html =~ "Show Contract monitor"
      assert html =~ contract_monitor.contract_address
    end

    test "updates contract_monitor within modal", %{conn: conn, contract_monitor: contract_monitor} do
      {:ok, show_live, _html} = live(conn, ~p"/contract_monitors/#{contract_monitor}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Contract monitor"

      assert_patch(show_live, ~p"/contract_monitors/#{contract_monitor}/show/edit")

      assert show_live
             |> form("#contract_monitor-form", contract_monitor: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#contract_monitor-form", contract_monitor: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/contract_monitors/#{contract_monitor}")

      html = render(show_live)
      assert html =~ "Contract monitor updated successfully"
      assert html =~ "some updated contract_address"
    end
  end
end
