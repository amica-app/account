defmodule RomulusWeb.Router do
  use RomulusWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
    plug(ProperCase.Plug.SnakeCaseParams)

    plug(
      Guardian.Plug.Pipeline,
      error_handler: RomulusWeb.SessionController,
      module: RomulusWeb.Guardian
    )

    plug(Guardian.Plug.VerifyHeader, realm: "Token")
    plug(Guardian.Plug.LoadResource, allow_blank: true)
  end

  scope "/", RomulusWeb do
    pipe_through(:api)
    get("/user", UserController, :current_user)
    put("/user", UserController, :update)
    post("/users", UserController, :create)
    post("/users/login", SessionController, :create)

    get("/search/:username", ProfileController, :index)
    get("/profiles/:username", ProfileController, :getprofile)
  end
end
