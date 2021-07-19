defmodule AchievementCategory do
  @enforce_keys [
    :id,
    :name,
    :achievements
  ]

  defstruct [
    :id,
    :name,
    :achievements
  ]

  @type t() :: %__MODULE__{
          id: integer(),
          name: String.t(),
          achievements: [%Achievement{}]
        }
end
