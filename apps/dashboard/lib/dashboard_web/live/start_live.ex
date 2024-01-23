defmodule DashboardWeb.Live.StartLive do
  use DashboardWeb, :component
  def start_parse(assigns)  do

    ~H"""
      <h2 class="text-center mb-4 mt-2">Start Parse</h2>
      <div class="w-100 d-flex justify-content-center align-items-center">
      <button class = "btn btn-primary px-4 text-center" phx-click="csv-parse">Start</button>
      </div>
      <%= case Map.get(assigns, :state).status do %>
          <% :init  -> %>
            <p class="mt-2 text-center text-info"> Click on Start to parse CSVs </p>
          <% :working -> %>
            <p class="mt-2 text-center text-info"> Analyzing files it may take some time </p>
          <% :finish -> %>
            <p class="mt-2 text-center text-success"> The csv sucessfully parsed </p>
          <% _ -> %>
          <p class="alert alert-danger text-center mt-2">There was a problem while parsing</p>
              <ul>
              <%= Enum.map(Map.get(assigns, :reason,[]), fn s -> %>
                <li class="list-group-item"><%=s%></li>
              <% end) %>
              </ul>
      <% end %>
      <%= if Map.get(assigns, :state).status != :init do%>
        <table class = "table w-75 m-2 table-bordered border-dark">
          <tr>
            <th> File name </th>
            <th> rows_processed </th>
            <th> row_count </th>
          </tr>
          <%= Enum.map(Map.get(assigns, :state).files, fn {_path, file} -> %>
            <tr>
              <td> <%= file.name %> </td>
              <td> <%= file.rows_processed %> </td>
              <td> <%= file.row_count %> </td>
            </tr>
          <% end) %>
        </table>
      <% end %>
    """
  end
end
