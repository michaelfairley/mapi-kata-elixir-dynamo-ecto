defmodule Microblog.Mixfile do
  use Mix.Project

  def project do
    [ app: :microblog,
      version: "0.0.1",
      build_per_environment: true,
      dynamos: [Microblog.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { Microblog, [] } ]
  end

  defp deps do
    [ { :cowboy, github: "extend/cowboy" },
      { :dynamo, "~> 0.1.0-dev", github: "elixir-lang/dynamo" },
		  { :postgrex, github: "ericmj/postgrex" },
			{ :ecto, github: "elixir-lang/ecto" },
			{ :jsx, github: "talentdeficit/jsx" } ]
  end
end
