defmodule Elixir.Romulus.Repo.Migrations.AlterTodos do
  use Ecto.Migration

  def change do
    alter table(:todos) do
      add :title, :string
    end
  end
end
