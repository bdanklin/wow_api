defmodule WowCommunityApi.Character do
  require CacheUtils

  @moduledoc """
  Functions related to characters.
  """

  @doc """
  Returns a list of races and their associated faction, name, unique ID, and skin.
  Includes allied races.
  """
  @spec get_playable_races!() :: [Race.t()]
  def get_playable_races! do
    CacheUtils.get_cache_or :wow_cache, :playable_races do
      WowApi.get("wow/data/character/races")
      |> WowApi.handle_if_error!()
      |> ApiUtils.convert_body_to_struct!("races", Race)
    end
  end

  @doc """
  Returns a list of character classes.
  """
  @spec get_playable_classes!() :: [Class.t()]
  def get_playable_classes! do
    CacheUtils.get_cache_or :wow_cache, :playable_classes do
      WowApi.get("wow/data/character/classes")
      |> WowApi.handle_if_error!()
      |> ApiUtils.convert_body_to_struct!("classes", Class)
    end
  end

  @doc """
  Returns a list of all achievements that characters can earn as well as the category structure and hierarchy.
  """
  @spec get_achievement_categories!() :: [AchievementCategory.t()]
  def get_achievement_categories!() do
    CacheUtils.get_cache_or :wow_cache, :achievement_groups do
      WowApi.get("wow/data/character/achievements")
      |> WowApi.handle_if_error!()
      |> ApiUtils.convert_body_to_struct!("achievements", AchievementCategory)
    end
  end
end
