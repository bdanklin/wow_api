defmodule Mount do
  @enforce_keys [
    :name,
    :spell_id,
    :creature_id,
    :item_id,
    :quality_id,
    :is_ground,
    :is_flying,
    :is_aquatic,
    :is_jumping
  ]

  defstruct [
    :name,
    :spell_id,
    :creature_id,
    :item_id,
    :quality_id,
    :icon,
    :is_ground,
    :is_flying,
    :is_aquatic,
    :is_jumping
  ]

  @type t() :: %__MODULE__{
          name: String.t(),
          icon: String.t(),
          spell_id: integer(),
          creature_id: integer(),
          item_id: integer(),
          quality_id: integer(),
          is_ground: boolean(),
          is_flying: boolean(),
          is_aquatic: boolean(),
          is_jumping: boolean()
        }
end
