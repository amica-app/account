defmodule Romulus.TodoItems do
  alias Romulus.{Repo, Todo}
  import Ecto.Query

  def items do
    (from t in Todo, select: {t.item, t.title, t.completed})
    |> Repo.all
  end

  def add(item, title) do
    Todo.changeset(%Todo{}, %{item: item, title: title})
    |> Repo.insert!
  end
end
