defmodule Achievement do
  @enforce_keys [
    :id,
    :title,
    :points,
    :description,
    :reward_items,
    :icon,
    :criteria,
    :account_wide,
    :faction_id
  ]

  defstruct [
    :id,
    :title,
    :points,
    :description,
    :reward_items,
    :icon,
    :criteria,
    :account_wide,
    :faction_id
  ]

  @type t() :: %__MODULE__{
          id: integer(),
          title: String.t(),
          points: integer(),
          description: String.t(),
          reward_items: [%{}],
          icon: String.t(),
          criteria: [%{}],
          account_wide: boolean(),
          faction_id: integer()
        }
end
