defmodule MapiKataElixirDynamoEcto.Mixfile do
  use Mix.Project

  def project do
    [ app: :mapi_kata_elixir_dynamo_ecto,
      version: "0.0.1",
      build_per_environment: true,
      dynamos: [MapiKataElixirDynamoEcto.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { MapiKataElixirDynamoEcto, [] } ]
  end

  defp deps do
    [ { :cowboy, github: "extend/cowboy" },
      { :dynamo, "~> 0.1.0-dev", github: "elixir-lang/dynamo" },
		  { :postgrex, github: "ericmj/postgrex" },
			{ :ecto, github: "elixir-lang/ecto" } ]
  end
end
