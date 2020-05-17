defmodule Romulus.Accounts.Users do
  @moduledoc """
  The boundry for the Users system
  """

  alias Romulus.Repo
  alias Romulus.Accounts.User
  alias Romulus.Accounts.UserFollower

  def get_user!(id), do: Repo.get!(User, id)
  def get_by_username(username), do: Repo.get_by(User, username: username)

  def update_user(user, attrs) do
    user
    |> User.changeset(attrs)
    |> Romulus.Accounts.Auth.hash_password()
    |> Repo.update()
  end
end
