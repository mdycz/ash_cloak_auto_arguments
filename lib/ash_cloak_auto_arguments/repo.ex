defmodule AshCloakAutoArguments.Repo do
  use AshPostgres.Repo,
    otp_app: :ash_cloak_auto_arguments

  @impl true
  def installed_extensions do
    # Add extensions here, and the migration generator will install them.
    ["ash-functions", "citext"]
  end

  @impl true
  def prefer_transaction? do
    false
  end

  @impl true
  def min_pg_version do
    %Version{major: 16, minor: 0, patch: 0}
  end
end
