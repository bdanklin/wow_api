defmodule ApiConstants do
  @moduledoc false

  def regions,
    do: [
      :us,
      :eu,
      :kr,
      :tw
    ]

  @doc """
  Region Host List
  https://develop.battle.net/documentation/guides/regionality-partitions-and-localization
  """
  def region_language_groups,
    do: %{
      us: [:en_US, :es_MX, :pt_BR],
      eu: [:en_GB, :es_ES, :fr_FR, :ru_RU, :de_DE, :pt_PT, :it_IT],
      ko: [:ko_KR],
      tw: [:zh_TW]
    }
end
