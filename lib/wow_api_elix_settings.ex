defmodule WowApiElix.Settings do
  @moduledoc false

  def get_client_id_and_secret do
    client_id = Application.get_env(:wow_api_elix, :api_client_id)
    secret_key = Application.get_env(:wow_api_elix, :api_secret_key)

    if !is_nil(client_id) and !is_nil(secret_key) do
      [client_id: client_id, secret_key: secret_key]
    else
      raise ConfigError,
        message:
          "Client ID (:api_client_id) or Secret Key (:api_secret_key) is missing in the config."
    end
  end

  def get_region do
    region = Application.get_env(:wow_api_elix, :api_region)

    if region do
      available_regions = ApiConstants.regions()

      if region in available_regions do
        region
      else
        raise ConfigError, message: "Unknown region '#{region}' in config."
      end
    else
      raise ConfigError, message: "Region (:api_region) is not defined in config."
    end
  end

  def get_locale do
    locale = Application.get_env(:wow_api_elix, :api_language)
    region_language_groups = ApiConstants.region_language_groups()
    region = get_region()

    if locale do
      available_languages = region_language_groups[region]

      if locale in available_languages do
        locale
      else
        raise ConfigError,
          message: "Language #{locale} is not supported in region #{region}."
      end
    else
      raise ConfigError,
        message: "Language #{locale} does not exist."
    end
  end

  def validate_config do
    get_client_id_and_secret()
    get_locale()
    get_region()
    {:ok}
  end
end
