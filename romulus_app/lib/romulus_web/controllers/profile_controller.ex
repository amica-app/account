defmodule RomulusWeb.ProfileController do
  use RomulusWeb, :controller
  use RomulusWeb.GuardedController

  alias Romulus.Accounts.{Users, User}

  action_fallback(RomulusWeb.FallbackController)

  #plug(Guardian.Plug.EnsureAuthenticated when action in [:follow, :unfollow])

  def index(conn, %{"username" => username}, current_user) do
    users = [
      %{name: "Joe",
        email: "joe@example.com",
        password: "topsecret",
        stooge: "moe"},
      %{name: "Anne",
        email: "anne@example.com",
        password: "guessme",
        stooge: "larry"},
      %{name: "Franklin",
        email: "franklin@example.com",
        password: "guessme",
        stooge: "curly"},
    ]
    json conn, users
  end

  # def searchprofiles() do
  #   users = [
  #     %{name: "Joe",
  #       email: "joe@example.com",
  #       password: "topsecret",
  #       stooge: "moe"},
  #     %{name: "Anne",
  #       email: "anne@example.com",
  #       password: "guessme",
  #       stooge: "larry"},
  #     %{name: "Franklin",
  #       email: "franklin@example.com",
  #       password: "guessme",
  #       stooge: "curly"},
  #   ]
  #   json conn, users
  # end

  def getprofile(conn, %{"username" => username}, current_user) do
    IO.puts "I am in show function"
    users = 
      %{name: "Joe",
        email: "joe@example.com",
        password: "topsecret",
        stooge: "moe"}
    json conn, users
    # case Users.get_by_username(username) do
    #   user = %User{} ->
    #     conn
    #     |> put_status(:ok)
    #     |> render("show.json", user: user)

    #   nil ->
    #     conn
    #     |> put_status(:not_found)
    #     |> render(RomulusWeb.ErrorView, "404.json")
    # end
  end
end
