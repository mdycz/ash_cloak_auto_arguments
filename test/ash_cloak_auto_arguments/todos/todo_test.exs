defmodule AshCloakAutoArguments.Todos.TodoTest do
  use AshCloakAutoArguments.DataCase, async: true

  describe "AshCloak automatically adding encrypted arguments to all actions" do
    test "AshCloakAutoArguments.Todos.create_todo/0-2" do
      assert todo =
               %{title: "Fix a bug"}
               |> AshCloakAutoArguments.Todos.create_todo!()

      assert_raise Ash.Error.Invalid, ~r/No such input `some_secret`/, fn ->
        AshCloakAutoArguments.Todos.complete_todo!(todo, %{
          some_secret: "what is this doing here?"
        })
      end
    end
  end
end
