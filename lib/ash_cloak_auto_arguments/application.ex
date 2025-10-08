defmodule AshCloakAutoArguments.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [AshCloakAutoArguments.Repo]

    opts = [strategy: :one_for_one, name: AshCloakAutoArguments.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
