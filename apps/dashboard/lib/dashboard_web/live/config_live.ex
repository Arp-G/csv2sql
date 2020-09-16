defmodule DashboardWeb.ConfigLive do
  use DashboardWeb, :live_view
  alias DashboardWeb.Helper.ConfigHelper

  @impl true
  def mount(_params, _session, socket) do
    inital_config = ConfigHelper.get_initial_config()
    Cachex.put_many(:config_cache, ConfigHelper.convert_to_klist(inital_config))

    {:ok,
     assign(socket,
       config: inital_config,
       valid_config: ConfigHelper.validate_config(inital_config)
     )}
  end

  @impl true
  def handle_event(
        "update_config",
        %{"config" => config} = param,
        %{assigns: assigns} = socket
      ) do
    value = param["value"] || "false"
    value = if String.trim(value) == "", do: nil, else: value
    config = String.to_atom(config)
    Cachex.put(:config_cache, config, value)
    IO.inspect({config, value})

    {:noreply,
     assign(socket,
       config_list: Map.put(assigns, config, value),
       valid_config: ConfigHelper.validate_config(assigns.config)
     )}
  end

  @impl true
  def handle_params(_unsigned_params, _uri, socket) do
    {:noreply, socket}
  end
end
