defmodule Item do
  defstruct [
    :id,
    :name,
    :icon,
    :quality,
    :item_level,
    :tooltip_params,
    :stats,
    :armor,
    :context,
    :bonus_lists,
    :artifact_id,
    :artifact_appearance_id,
    :artifact_traits,
    :relics,
    :appearance
  ]

  @type t() :: %__MODULE__{
          id: integer(),
          name: String.t(),
          icon: String.t(),
          quality: integer(),
          item_level: integer(),
          tooltip_params: %{
            timewalker_level: integer(),
            azerite_power0: integer(),
            azerite_power1: integer(),
            azerite_power3: integer(),
            azerite_power4: integer(),
            azerite_power_level: integer()
          },
          stats: [],
          armor: integer(),
          context: String.t(),
          bonus_lists: [],
          artifact_id: integer(),
          artifact_appearance_id: integer(),
          artifact_traits: [],
          relics: [],
          appearance: integer()
        }
end
