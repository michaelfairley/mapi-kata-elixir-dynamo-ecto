config :dynamo,
  compile_on_demand: true,
  reload_modules: true,
  cache_static: false,
  exceptions_handler: Exceptions.Debug

config :server, port: 12346
