import Config

if config_env() == :prod do
  config :ash_cloak_auto_arguments, AshCloakAutoArguments.Repo,
    pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")
end
