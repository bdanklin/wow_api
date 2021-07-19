defmodule Boss do
  @enforce_keys [
    :id,
    :name,
    :url_slug,
    :zone_id,
    :available_in_normal_mode,
    :available_in_heroic_mode,
    :health,
    :heroic_health,
    :level,
    :heroic_level,
    :npcs,
    :encounter_faction
  ]

  defstruct [
    :id,
    :name,
    :url_slug,
    :description,
    :zone_id,
    :available_in_normal_mode,
    :available_in_heroic_mode,
    :health,
    :heroic_health,
    :level,
    :heroic_level,
    :journal_id,
    :npcs,
    :encounter_faction
  ]

  @type t() :: %__MODULE__{
          id: integer(),
          name: String.t(),
          url_slug: String.t(),
          description: String.t(),
          zone_id: integer(),
          available_in_normal_mode: boolean(),
          available_in_heroic_mode: boolean(),
          health: integer(),
          heroic_health: integer(),
          level: integer(),
          heroic_level: integer(),
          journal_id: integer(),
          npcs: [
            %{
              id: integer(),
              creature_display_id: integer(),
              name: String.t(),
              url_slug: String.t()
            }
          ],
          encounter_faction: integer()
        }
end
