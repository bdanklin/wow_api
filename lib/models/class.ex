defmodule Class do
  @enforce_keys [
    :id,
    :mask,
    :power_type,
    :name
  ]

  defstruct [
    :id,
    :mask,
    :power_type,
    :name
  ]

  @type t() :: %__MODULE__{
          id: integer(),
          mask: integer(),
          power_type: :rage | :mana | :focus | :energy | :runic_power | :fury
        }
end
