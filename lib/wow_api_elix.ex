defmodule WowApiElix do
  use Application

  @moduledoc false

  def start(_start_type, _start_args) do
    # Validate settings on start to avoid config errors on requests.
    WowApiElix.Settings.validate_config()
    Cachex.start_link(:oauth2, [])
    Cachex.start_link(:wow_cache, [])
    Cachex.start_link(:wow_auction_cache, [])
  end
end
