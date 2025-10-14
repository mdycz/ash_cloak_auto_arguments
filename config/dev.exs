import Config

config :ash_cloak_auto_arguments, AshCloakAutoArguments.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "ash_cloak_auto_arguments_dev",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# Vault configuration
config :ash_cloak_auto_arguments, AshCloakAutoArguments.Vault,
  ciphers: [
    default: {
      Cloak.Ciphers.AES.GCM,
      # In AES.GCM, it is important to specify 12-byte IV length for
      # interoperability with other encryption software. See this GitHub
      # issue for more details:
      # https://github.com/danielberkompas/cloak/issues/93
      #
      # In Cloak 2.0, this will be the default iv length for AES.GCM.
      tag: "AES.GCM.V1",
      key: Base.decode64!("ZkgHerIiKBDHkXi/3OxhYZFQ/aZDRvyxbV1/UXWHwoA="),
      iv_length: 12
    }
  ]

config :ash, policies: [show_policy_breakdowns?: true]
