defmodule RomulusWeb.ProfileController do
  use RomulusWeb, :controller
  use RomulusWeb.GuardedController

  alias Romulus.Accounts.{Users, User}

  action_fallback(RomulusWeb.FallbackController)

  plug(Guardian.Plug.EnsureAuthenticated when action in [:follow, :unfollow])

  def show(conn, %{"username" => username}, current_user) do
    case Users.get_by_username(username) do
      user = %User{} ->
        conn
        |> put_status(:ok)
        |> render("show.json", user: user, following: Users.is_following?(current_user, user))

      nil ->
        conn
        |> put_status(:not_found)
        |> render(RomulusWeb.ErrorView, "404.json")
    end
  end
end
