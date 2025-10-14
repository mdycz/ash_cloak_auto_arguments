defmodule AshCloakAutoArguments.Todos do
  use Ash.Domain,
    otp_app: :ash_cloak_auto_arguments

  resources do
    resource AshCloakAutoArguments.Todos.Todo do
      define :create_todo, action: :create
      define :complete_todo, action: :complete
    end
  end
end
