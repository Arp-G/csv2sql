defmodule DashboardWeb.ConfigLive do
  use DashboardWeb, :live_view
  alias DashboardWeb.Helper.ConfigHelper

  @impl true
  def mount(_params, _session, socket) do
    inital_config = ConfigHelper.get_config_from_cache()

    {:ok,
     assign(socket,
       config: inital_config
     )}
  end

  @impl true
  def handle_event(
        "update_config",
        %{"config" => config} = param,
        socket
      ) do
    value =
      case param["value"] do
        nil -> nil
        "on" -> "true"
        value -> if String.trim(value) == "", do: nil, else: value
      end

    Cachex.put(:config_cache, String.to_atom(config), value)
    {:noreply, socket}
  end

  @impl true
  def handle_params(_unsigned_params, _uri, socket) do
    {:noreply, socket}
  end
end
