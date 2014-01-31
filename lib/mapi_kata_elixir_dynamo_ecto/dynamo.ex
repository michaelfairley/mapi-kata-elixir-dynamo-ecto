defmodule MapiKataElixirDynamoEcto.Dynamo do
  use Dynamo

  config :dynamo,
    # The environment this Dynamo runs on
    env: Mix.env,

    # The OTP application associated with this Dynamo
    otp_app: :mapi_kata_elixir_dynamo_ecto,

    # The endpoint to dispatch requests to
    endpoint: ApplicationRouter,

    # The route from which static assets are served
    # You can turn off static assets by setting it to false
    static_route: "/static"

  # Uncomment the lines below to enable the cookie session store
  # config :dynamo,
  #   session_store: Session.CookieStore,
  #   session_options:
  #     [ key: "_mapi_kata_elixir_dynamo_ecto_session",
  #       secret: "xL3aWBzWuCtVOm0uhLoZxvD6oYWP5TkIjamAR3GTS/QJNHDyzlkkxDXtVeJNcJu4"]

  # Default functionality available in templates
  templates do
    use Dynamo.Helpers
  end
end
