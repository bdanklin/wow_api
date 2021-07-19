defmodule WowApi do
  use HTTPoison.Base
  @moduledoc false

  def process_url(url) do
    region = WowApiElix.Settings.get_region() |> Atom.to_string()
    "https://#{region}.api.blizzard.com/#{url}"
  end

  def process_request_headers(headers = []) do
    Enum.into(headers, [{"Authorization", "Bearer " <> OauthApi.get_access_token()}])
  end

  def handle_if_error!(response) do
    case response do
      {:ok, %HTTPoison.Response{body: body}} ->
        body

      {:error, %HTTPoison.Error{reason: reason}} ->
        raise ApiError, message: "An error occurred: #{reason}"
    end
  end
end
