defmodule RealmStatus do
  @enforce_keys [
    :type,
    :population,
    :queue,
    :status,
    :name,
    :slug,
    :battlegroup,
    :locale,
    :timezone,
    :connected_realms
  ]

  defstruct [
    :type,
    :population,
    :queue,
    :status,
    :name,
    :slug,
    :battlegroup,
    :locale,
    :timezone,
    :connected_realms
  ]

  @type t() :: %__MODULE__{
          type: String.t(),
          population: atom(),
          queue: boolean(),
          status: boolean(),
          name: String.t(),
          slug: String.t(),
          battlegroup: String.t(),
          locale: String.t(),
          timezone: String.t(),
          connected_realms: [atom()]
        }
end
