defmodule DashboardWeb.Live.Modal.DateTimePatternsModal do
  use DashboardWeb, :component
  import Dashboard.Helpers

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
    custom_date_time_patterns_added =
      assigns.changeset |> Ecto.Changeset.get_field(:date_time_patterns, []) |> length() != 0

    custom_date_patterns_added =
      assigns.changeset |> Ecto.Changeset.get_field(:date_patterns, []) |> length() != 0

    assigns =
      assigns
      |> assign(:custom_date_patterns_added, custom_date_patterns_added)
      |> assign(:custom_date_time_patterns_added, custom_date_time_patterns_added)

    ~H"""
    <DashboardWeb.Live.Modals.modal title="Add additional Date Time patterns">
      <div>
        <div class="fst-italic mt-2 ms-2">
          Add date patterns
        </div>
        <!-- TODO: Make this better: data list only works on double click -->
        <datalist id="date-time-patterns-suggestions">
          <option value="{YYYY}-{0M}-{0D} {h24}:{m}:{s}" />
          <option value="{0M}-{0D}-{YYYY} {h12}{am}-{m}" />
          <option value="{0M}/{0D}/{YY} {h12}**{AM}/{s}/{m}" />>
        </datalist>

        <div class="container">
          <div class="row">
            <div class="col-6">
              <div class="border">
                <div class="scrollable-container" id="date-patterns-container" class="border">
                  <%= if @custom_date_patterns_added do %>
                    <%= for {date_patterns_form, index} <- Enum.with_index(inputs_for(@form, :date_patterns), 1) do %>
                      <div class="d-flex flex-row">
                        <div class="input-group mb-3">
                          <span class="input-group-text fw-bold pe-2 pt-1"><%= index %>.</span>
                          <%= text_input(date_patterns_form, :pattern,
                            disabled: index == 1,
                            class: input_class(index, :date, @matching_date_time),
                            placeholder: "Pattern",
                            list: "date-patterns-suggestions"
                          ) %>
                        </div>

                        <%= hidden_input(date_patterns_form, :id) %>

                        <%= unless index == 1 do %>
                          <div
                            role="button"
                            phx-click="remove-date-pattern"
                            phx-value-attrid={
                              Ecto.Changeset.get_field(date_patterns_form.source, :id)
                            }
                          >
                            <IconSvg.remove_icon class="ms-2 pt-1" />
                          </div>
                        <% end %>
                      </div>
                    <% end %>
                  <% else %>
                    <div class="text-center mt-4 pt-4">
                      <div><IconSvg.empty_icon {%{height: 100, width: 100}} /></div>
                      <div class="fw-bold fst-italic font-monospace text-danger">
                        No custom date patterns added!
                      </div>
                    </div>
                  <% end %>
                </div>
                <div class="add-pattern" phx-click="add-new-date-pattern">
                  <IconSvg.add_icon {%{width: 28}} />
                  <span> Add datetime pattern </span>
                </div>
              </div>
              <div class="border">
                <div class="scrollable-container" id="date-time-patterns-container">
                  <%= if @custom_date_time_patterns_added do %>
                    <%= for {date_time_patterns_form, index} <- Enum.with_index(inputs_for(@form, :date_time_patterns), 1) do %>
                      <div class="d-flex flex-row">
                        <div class="input-group mb-3">
                          <span class="input-group-text fw-bold pe-2 pt-1"><%= index %>.</span>
                          <%= text_input(date_time_patterns_form, :pattern,
                            disabled: index == 1,
                            class: input_class(index, :date_time, @matching_date_time),
                            placeholder: "Pattern",
                            list: "date-time-patterns-suggestions"
                          ) %>
                        </div>

                        <%= hidden_input(date_time_patterns_form, :id) %>

                        <%= unless index == 1 do %>
                          <div
                            role="button"
                            phx-click="remove-date-time-pattern"
                            phx-value-attrid={
                              Ecto.Changeset.get_field(date_time_patterns_form.source, :id)
                            }
                          >
                            <IconSvg.remove_icon class="ms-2 pt-1" />
                          </div>
                        <% end %>
                      </div>
                    <% end %>
                  <% else %>
                    <div class="text-center mt-4 pt-4">
                      <div><IconSvg.empty_icon {%{height: 100, width: 100}} /></div>
                      <div class="fw-bold fst-italic font-monospace text-danger">
                        No custom date time patterns added!
                      </div>
                    </div>
                  <% end %>
                </div>
                <div class="add-pattern" phx-click="add-new-date-time-pattern">
                  <IconSvg.add_icon {%{width: 28}} />
                  <span> Add datetime pattern </span>
                </div>
              </div>
            </div>
            <div class="col-6 border">
              <p>
                Add custom date time patterns
                Some commonly used pattern symbols are given below:
              </p>
              <div class="container small">
                <%= for {pattern, description} <- date_time_pattern_hints() do %>
                  <div class="row">
                    <div class="col-3"><%= pattern %></div>
                    <div class="col-1">-</div>
                    <div class="col-8"><%= description %></div>
                  </div>
                <% end %>
              </div>
              <p>*Fractional seconds and timezones are not supported.</p>

              <div id="date-time-try-it">
                <div class="d-flex flex-row">
                  <!-- TODO: Fix tolltip title gone on hook init -->
                  <.popup
                    title="Enter a sample date or date time to check if it matches any added custom patterns"
                    id="date-time-try-it-hint"
                  />
                  <label for="date-time-trial"> Enter sample date time </label>
                </div>
                <%= if present?(Ecto.Changeset.get_field(@changeset, :date_time_trial)) && is_nil(@matching_date_time) do %>
                  <span> No matching patterns found </span>
                <% end %>
                <%= text_input(@form, :date_time_trial,
                  class: "form-control",
                  placeholder: "Pattern",
                  id: "date-time-trial"
                ) %>
              </div>
            </div>
          </div>
        </div>
      </div>
    </DashboardWeb.Live.Modals.modal>
    """
  end

  defp date_time_pattern_hints, do: @date_time_pattern_hints

  defp input_class(index, type, {match_type, match_index})
       when type == match_type and index == match_index + 1,
       do: "form-control matched-input"

  defp input_class(_index, _type, _), do: "form-control"
end
