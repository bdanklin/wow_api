defmodule Race do
  @enforce_keys [
    :id,
    :mask,
    :side,
    :name
  ]

  defstruct [
    :id,
    :mask,
    :side,
    :name
  ]

  @type t() :: %__MODULE__{
          id: integer(),
          mask: integer(),
          side: :alliance | :horde,
          name: String.t()
        }
end
