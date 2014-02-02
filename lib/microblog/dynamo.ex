defmodule Microblog.Dynamo do
  use Dynamo

  config :dynamo,
    env: Mix.env,
    otp_app: :mapi_kata_elixir_dynamo_ecto,
    endpoint: ApplicationRouter,
    static_route: false
end
