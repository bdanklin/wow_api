defmodule Auction do
  defstruct [
    :auc,
    :item,
    :owner,
    :owner_realm,
    :bid,
    :buyout,
    :quantity,
    :time_left,
    :rand,
    :seed,
    :context,
    :bonus_lists,
    :modifiers,
    :pet_species_id,
    :pet_breed_id,
    :pet_level,
    :pet_quality_id
  ]

  @type t() :: %__MODULE__{
          auc: integer(),
          item: integer(),
          owner: String.t(),
          owner_realm: String.t(),
          bid: pos_integer(),
          buyout: pos_integer(),
          quantity: pos_integer(),
          time_left: :VERY_LONG | :LONG | :MEDIUM | :SHORT,
          rand: integer(),
          seed: integer(),
          context: integer(),
          bonus_lists: [],
          modifiers: [],
          pet_species_id: integer(),
          pet_breed_id: integer(),
          pet_level: integer(),
          pet_quality_id: integer()
        }
end
