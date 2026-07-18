defmodule Csv2sql.SentryClient do
  @moduledoc """
  Minimal Sentry HTTP transport on Erlang's built-in `:httpc` — avoids
  pulling an HTTP client dependency into the binary just for opt-in
  crash reports.
  """

  @behaviour Sentry.HTTPClient

  @impl true
  def post(url, headers, body) do
    request = {
      String.to_charlist(url),
      Enum.map(headers, fn {key, value} ->
        {String.to_charlist(key), String.to_charlist(value)}
      end),
      ~c"application/json",
      body
    }

    http_options = [timeout: 5_000, connect_timeout: 5_000, ssl: ssl_options(url)]

    case :httpc.request(:post, request, http_options, body_format: :binary) do
      {:ok, {{_version, status, _reason}, response_headers, response_body}} ->
        headers =
          Enum.map(response_headers, fn {key, value} ->
            {to_string(key), to_string(value)}
          end)

        {:ok, status, headers, response_body}

      {:error, reason} ->
        {:error, reason}
    end
  end

  defp ssl_options(url) do
    if String.starts_with?(url, "https") do
      [
        verify: :verify_peer,
        cacerts: :public_key.cacerts_get(),
        customize_hostname_check: [match_fun: :public_key.pkix_verify_hostname_match_fun(:https)]
      ]
    else
      []
    end
  end
end
