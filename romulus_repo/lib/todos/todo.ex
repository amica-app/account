defmodule Romulus.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :item, :string
    field :completed, :boolean, default: false
    field :title, :string
    timestamps
  end

  @required_fields ~w(item title completed)
  @optional_fields ~w()


  def changeset(record, params \\ :empty) do
    record
    |> cast(params, @required_fields, @optional_fields)
  end
end
