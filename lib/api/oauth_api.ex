defmodule OauthApi do
  require CacheUtils

  @moduledoc false
  @expires_in 86399

  @doc """
  Generates an OAuth2 token for Blizzard API requests.
  Using grant type "Client Credentials". This is being cached,
  so when it's expired, it'll be invalidated.
  https://develop.battle.net/documentation/guides/using-oauth/client-credentials-flow
  """
  def get_access_token do
    CacheUtils.get_cache_or :oauth2, :access_token do
      form =
        {:multipart, [{"Content-Disposition", "form-data"}, {"grant_type", "client_credentials"}]}

      headers = [
        {"Authorization", "Basic #{generate_basic_auth_credentials()}"},
        {"Content-Type", "multipart/form-data;charset=utf-8;"}
      ]

      HTTPoison.post("https://us.battle.net/oauth/token", form, headers)
      |> WowApi.handle_if_error!()
      |> Poison.decode!()
      |> Map.get("access_token")
    after
      Cachex.expire(:oauth2, :access_token, :timer.seconds(@expires_in))
    end
  end

  defp generate_basic_auth_credentials do
    credentials = WowApiElix.Settings.get_client_id_and_secret()
    Base.encode64(credentials[:client_id] <> ":" <> credentials[:secret_key])
  end
end
