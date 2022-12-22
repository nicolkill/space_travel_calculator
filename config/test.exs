import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :space_travel_calculator, SpaceTravelCalculatorWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "/BHGjZsqfvVwcvU3oqPsZwIFUH4/QZKDa+wHoidJ66JuuZyT0oAc4Dj1H1c8jOyc",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
