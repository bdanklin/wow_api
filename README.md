[![](https://img.shields.io/hexpm/v/wow_api_elix.svg?style=flat)](https://hex.pm/packages/wow_api_elix)
[![](https://img.shields.io/hexpm/l/wow_api_elix.svg?style=flat)](https://hex.pm/packages/wow_api_elix)
[![](https://img.shields.io/badge/hex.pm-docs-blue.svg)](https://hexdocs.pm/wow_api_elix/)


# World of Warcraft Blizzard API for Elixir
https://develop.battle.net/documentation/api-reference

## Current features
* Different regions
* Achievements
* Realm status
* Classes
* Races
* Caching
* Mounts
* Pets
* Boss

## Coming soon
* Languages

## Setting up
Set this up in your `config.exs`
```elixir
config :wow_api_elix, api_client_id: ""     # Client ID
config :wow_api_elix, api_secret_key: ""    # Client Secret
config :wow_api_elix, api_language: :en_US  # API language, see below for available languages.
config :wow_api_elix, api_region: :eu       # API region, see below for available regions.

#
# Available languages in regions
#

%{
  # Americas
  us: [
    :en_US, # English – US
    :es_MX, # Spanish – Mexico
    :pt_BR  # Portuguese – Brazil
    ],
  # Europe
  eu: [
    :en_GB, # English – Great Britain
    :es_ES, # Spanish – Spain
    :fr_FR, # French
    :ru_RU, # Russian
    :de_DE, # German
    :pt_PT, # Portuguese – Portugal
    :it_IT  # Italian
    ],
  # Korea
  ko: [
    :ko_KR  # Korean
    ],
  # Taiwan
  tw: [
    :zh_TW  # Taiwanese Mandarin
  ]
}

#
# Available regions
#

[
  :us,  # Americas
  :eu,  # Europe
  :kr,  # Korea
  :tw   # Taiwan
]
```


## Installation
The package is available at [Hex.pm](https://hex.pm/packages/wow_api_elix).

```elixir
def deps do
  [
    {:wow_api_elix, "~> 0.2.3"}
  ]
end
```
