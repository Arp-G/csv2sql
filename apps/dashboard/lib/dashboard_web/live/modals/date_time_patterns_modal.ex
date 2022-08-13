defmodule DashboardWeb.Live.Modal.DateTimePatternsModal do
  use DashboardWeb, :component

  @date_time_pattern_hints [
    {"{YYYY}", "full year number (0..9999)"},
    {"{YY}", "the last two digits of the year number (0.99)"},
    {"{M}", "month number (1..12)"},
    {"{Mshort}", "abbreviated month name (Jan..Dec, no padding)"},
    {"{Mfull}", "full month name (January..December, no padding)"},
    {"{D}", "day number (1..31)"},
    {"{Dord}", "ordinal day of the year (1..366)"},
    {"{h24}", "hour of the day (00..23)"},
    {"{h12}", "hour of the day (1..12)"},
    {"{m}", "minutes of the hour (00..59)"},
    {"{s}", "seconds of the minute (00..60)"},
    {"{am}", "lowercase am or pm (no padding)"},
    {"{AM}", "uppercase AM or PM (no padding)"}
  ]

  def date_time_patterns_modal(assigns) do
    custom_date_patterns_added =
      assigns.changeset |> Ecto.Changeset.get_field(:date_time_patterns, []) |> length() != 0

    ~H"""
      <DashboardWeb.Live.Modals.modal title="Add additional Date Time patterns">
        <div>
          <div class="fst-italic mt-2 ms-2">
            Add datetime patterns
          </div>

          <!-- TODO: Make this better: data list only works on double click -->
          <datalist id="date-time-patterns-suggestions">
            <option value="{YYYY}-{0M}-{0D} {h24}:{m}:{s}"/>
            <option value="{0M}-{0D}-{YYYY} {h12}{am}-{m}"/>
            <option value="{0M}/{0D}/{YY} {h12}**{AM}/{s}/{m}"/>>
          </datalist>

          <div class="container">
            <div class="row">
              <div class="col-6 border" id="date-time-patterns-container">
                <%= if custom_date_patterns_added do %>
                  <%= for {date_time_patterns_form, index} <- Enum.with_index(inputs_for(@form, :date_time_patterns), 1) do %>
                    <div class="d-flex flex-row">
                      <div class="input-group mb-3">
                        <span class="input-group-text fw-bold pe-2 pt-1"><%= index %>.</span>
                        <%= text_input date_time_patterns_form, :pattern, class: "form-control", placeholder: "Pattern", list: "date-time-patterns-suggestions" %>
                      </div>

                      <%= hidden_input(date_time_patterns_form, :id) %>

                      <div role="button" phx-click="remove-date-time-pattern" phx-value-attrid={Ecto.Changeset.get_field(date_time_patterns_form.source, :id)}>
                        <IconSvg.remove_icon class="ms-2 pt-1"/>
                      </div>
                    </div>
                  <% end %>
                <% else %>
                  <div class="text-center mt-4 pt-4">
                    <div> <IconSvg.empty_icon {%{height: 100, width: 100}}/> </div>
                    <div class="fw-bold fst-italic font-monospace text-danger"> No custom date time patterns added! </div>
                  </div>
                <% end %>
              </div>
              <div class="col-6 border">
                <p>
                  Add custom date time patterns
                  Some commonly used pattern symbols are given below:
                </p>
                <div class="container small">
                  <%= for {pattern, description} <- date_time_pattern_hints() do %>
                    <div class="row">
                      <div class="col-3"> <%= pattern %> </div>
                      <div class="col-1"> - </div>
                      <div class="col-8"> <%= description %> </div>
                    </div>
                  <% end %>
                </div>
                <p> *Fractional seconds and timezones are not supported. </p>
              </div>
              <div class="col-8 add-link text-center">
                <IconSvg.add_icon {%{width: 28}} />
                <span phx-click="add-new-date-time-pattern"> Add datetime pattern </span>
              </div>
            </div>
          </div>
        </div>
      </DashboardWeb.Live.Modals.modal>
    """
  end

  defp date_time_pattern_hints, do: @date_time_pattern_hints
end
