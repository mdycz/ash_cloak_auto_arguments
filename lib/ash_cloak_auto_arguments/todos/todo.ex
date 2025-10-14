defmodule AshCloakAutoArguments.Todos.Todo do
  use Ash.Resource,
    otp_app: :ash_cloak_auto_arguments,
    domain: AshCloakAutoArguments.Todos,
    extensions: [AshCloak],
    data_layer: AshPostgres.DataLayer

  cloak do
    vault AshCloakAutoArguments.Vault
    attributes [:some_secret]

    decrypt_by_default :some_secret
  end

  postgres do
    table "todos"
    repo AshCloakAutoArguments.Repo
  end

  actions do
    defaults [:update, :destroy, :read, create: [:title]]

    update :complete do
      change set_attribute(:completed, true)
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :title, :string

    attribute :completed, :boolean do
      allow_nil? false
      default false
    end

    attribute :some_secret, :string
  end
end
