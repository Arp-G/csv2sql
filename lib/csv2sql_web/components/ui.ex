defmodule Csv2sqlWeb.UI do
  @moduledoc """
  Small presentation components (Tailwind v4 + daisyUI).

  Every component declares its `attr`/`slot` contract and carries a
  `data-role` hook so tests select semantically, never by CSS classes.
  """

  use Phoenix.Component

  @doc "A titled card section."
  attr :title, :string, default: nil
  attr :role, :string, default: "card", doc: "data-role test hook"
  attr :class, :string, default: ""
  slot :inner_block, required: true
  slot :actions

  def card(assigns) do
    ~H"""
    <section data-role={@role} class={["card bg-base-100 border border-base-300 shadow-sm", @class]}>
      <div class="card-body p-5 gap-4">
        <div :if={@title || @actions != []} class="flex items-center justify-between gap-2">
          <h2 :if={@title} class="card-title text-base">{@title}</h2>
          <div :if={@actions != []} class="flex items-center gap-2">{render_slot(@actions)}</div>
        </div>
        {render_slot(@inner_block)}
      </div>
    </section>
    """
  end

  @doc "A status badge with a consistent color per engine status."
  attr :status, :atom, required: true
  attr :role, :string, default: "status"

  def status_badge(assigns) do
    ~H"""
    <span data-role={@role} data-status={@status} class={["badge badge-sm", status_class(@status)]}>
      {status_label(@status)}
    </span>
    """
  end

  @doc "A compact labelled statistic."
  attr :label, :string, required: true
  attr :value, :any, required: true
  attr :role, :string, default: "stat"
  attr :tone, :atom, default: :neutral, values: [:neutral, :ok, :warn, :error]

  def stat(assigns) do
    ~H"""
    <div data-role={@role} class="flex flex-col min-w-20">
      <span class="text-xs uppercase tracking-wide text-base-content/60">{@label}</span>
      <span class={["text-lg font-semibold tabular-nums", tone_class(@tone)]}>{@value}</span>
    </div>
    """
  end

  @doc "A thin progress bar (0..100)."
  attr :percent, :integer, required: true
  attr :role, :string, default: "progress"

  def progress_bar(assigns) do
    ~H"""
    <div
      data-role={@role}
      data-percent={@percent}
      class="h-1.5 w-full rounded-full bg-base-300 overflow-hidden"
    >
      <div class="h-full rounded-full bg-primary transition-all" style={"width: #{@percent}%"}></div>
    </div>
    """
  end

  @doc "An activity counter chip (renders only when count > 0)."
  attr :label, :string, required: true
  attr :count, :integer, required: true
  attr :tone, :atom, default: :warn, values: [:neutral, :ok, :warn, :error]
  attr :role, :string, default: "activity-chip"

  def activity_chip(assigns) do
    ~H"""
    <span
      :if={@count > 0}
      data-role={@role}
      data-label={@label}
      class={["badge badge-outline gap-1 tabular-nums", tone_badge_class(@tone)]}
    >
      <span class="font-semibold">{@count}</span> {@label}
    </span>
    """
  end

  @doc "A centered empty state."
  attr :role, :string, default: "empty-state"
  slot :inner_block, required: true

  def empty_state(assigns) do
    ~H"""
    <div data-role={@role} class="py-10 text-center text-base-content/60 text-sm">
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc "A validation-layer pill (ledger/counts/fingerprints)."
  attr :layer, :atom, required: true
  attr :status, :atom, required: true
  attr :role, :string, default: "validation-pill"

  def validation_pill(assigns) do
    ~H"""
    <span
      data-role={@role}
      data-layer={@layer}
      data-status={@status}
      title={"#{@layer}: #{@status}"}
      class={["badge badge-xs gap-0.5", validation_class(@status)]}
    >
      {validation_icon(@status)} {@layer}
    </span>
    """
  end

  defp status_class(:pending), do: "badge-ghost"
  defp status_class(:analyzing), do: "badge-info"
  defp status_class(:creating_schema), do: "badge-info"
  defp status_class(:loading), do: "badge-primary"
  defp status_class(:validating), do: "badge-secondary"
  defp status_class(:done), do: "badge-success"
  defp status_class(:completed), do: "badge-success"
  defp status_class(:completed_with_errors), do: "badge-warning"
  defp status_class(:failed), do: "badge-error"
  defp status_class(:skipped), do: "badge-ghost"
  defp status_class(:cancelled), do: "badge-neutral"
  defp status_class(_other), do: "badge-ghost"

  defp status_label(:completed_with_errors), do: "completed w/ errors"
  defp status_label(:creating_schema), do: "creating schema"
  defp status_label(status), do: status |> Atom.to_string() |> String.replace("_", " ")

  defp tone_class(:ok), do: "text-success"
  defp tone_class(:warn), do: "text-warning"
  defp tone_class(:error), do: "text-error"
  defp tone_class(:neutral), do: ""

  defp tone_badge_class(:ok), do: "badge-success"
  defp tone_badge_class(:warn), do: "badge-warning"
  defp tone_badge_class(:error), do: "badge-error"
  defp tone_badge_class(:neutral), do: ""

  defp validation_class(:passed), do: "badge-success"
  defp validation_class(:failed), do: "badge-error"
  defp validation_class(:skipped), do: "badge-ghost"

  defp validation_icon(:passed), do: "✓"
  defp validation_icon(:failed), do: "✗"
  defp validation_icon(:skipped), do: "–"
end
