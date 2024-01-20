import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :vending_machine, VendingMachine.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "vending_machine_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :vending_machine, VendingMachineWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "C8WqqgrjoODfh5KaD46u4+Q08KZntiK4R14Ty8cK9pMX/hwWXOpfraK/8MWLDhnh",
  server: false

# In test we don't send emails.
config :vending_machine, VendingMachine.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
