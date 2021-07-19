defmodule Pet do
  @enforce_keys [
    :name,
    :can_battle,
    :creature_id,
    :family,
    :icon,
    :quality_id,
    :type_id,
    :stats,
    :strong_against,
    :weak_against
  ]

  defstruct [
    :name,
    :can_battle,
    :creature_id,
    :family,
    :icon,
    :quality_id,
    :type_id,
    :stats,
    :strong_against,
    :weak_against
  ]

  @type t() :: %__MODULE__{
          name: String.t(),
          icon: String.t(),
          creature_id: integer(),
          quality_id: integer(),
          can_battle: boolean(),
          family: atom(),
          type_id: integer(),
          stats: %{
            species_id: integer(),
            breed_id: integer(),
            pet_quality_id: integer(),
            level: integer(),
            health: integer(),
            power: integer(),
            speed: integer()
          },
          strong_against: [
            :critter
            | :elemental
            | :water
            | :undead
            | :mechanical
            | :dragonkin
            | :magical
            | :beast
            | :flying
            | :humanoid
          ],
          weak_against: [
            :critter
            | :elemental
            | :water
            | :undead
            | :mechanical
            | :dragonkin
            | :magical
            | :beast
            | :flying
            | :humanoid
          ]
        }
end
