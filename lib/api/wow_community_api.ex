defmodule WowCommunityApi do
  require CacheUtils

  @moduledoc """
    Provides functions for the World of Warcraft Community APIs.
    https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
  """

  @doc """
  Returns a list of all supported mounts.
  """
  @spec get_all_mounts!() :: [Mount.t()]
  def get_all_mounts! do
    CacheUtils.get_cache_or :wow_cache, :mounts do
      WowApi.get("wow/mount/")
      |> WowApi.handle_if_error!()
      |> ApiUtils.convert_body_to_struct!("mounts", Mount)
    end
  end

  @doc """
  Returns a list of all supported battle and vanity pets.
  """
  @spec get_all_pets!() :: [Pet.t()]
  def get_all_pets! do
    CacheUtils.get_cache_or :wow_cache, :pets do
      WowApi.get("wow/pet/")
      |> WowApi.handle_if_error!()
      |> ApiUtils.convert_body_to_struct!("pets", Pet)
    end
  end

  @doc """
  Returns a list of all supported bosses. A "boss" in this context should be considered a boss encounter, which may include more than one NPC.
  """
  @spec get_all_bosses!() :: [Boss.t()]
  def get_all_bosses! do
    CacheUtils.get_cache_or :wow_cache, :bosses do
      WowApi.get("wow/boss/")
      |> WowApi.handle_if_error!()
      |> ApiUtils.convert_body_to_struct!("bosses", Boss)
    end
  end

  @doc """
  The realm status API allows developers to retrieve realm status information. This information is limited to whether or not the realm is up, the type and state of the realm, and the current population.
  """
  @spec get_realm_status!() :: [RealmStatus.t()]
  def get_realm_status! do
    CacheUtils.get_cache_or :wow_cache, :realm_status do
      WowApi.get("wow/realm/status")
      |> WowApi.handle_if_error!()
      |> ApiUtils.convert_body_to_struct!("realms", RealmStatus)
    end
  end
end
