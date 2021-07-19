defmodule WowApiElix.MixProject do
  use Mix.Project

  def project do
    [
      name: "WoW API Elixir",
      description: "A Elixir library for Blizzard's World of Warcraft API.",
      source_url: "https://github.com/kevinbalouch/wow-api-elixir",
      docs: [
        main: "readme",
        extras: ["README.md"]
      ],
      app: :wow_api_elix,
      version: "0.2.3",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: [
        licenses: ["GNU GPLv3"],
        files: ~w(lib .formatter.exs mix.exs README* LICENSE*),
        links: %{"GitHub" => "https://github.com/kevinbalouch/wow-api-elixir"}
      ]
    ]
  end

  def application do
    [
      mod: {WowApiElix, []},
      applications: [:httpoison, :poison, :cachex],
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.4"},
      {:poison, "~> 3.1"},
      {:cachex, "~> 3.1"},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end
end
