defmodule RomulusWeb.ProfileView do
  use RomulusWeb, :view
  alias RomulusWeb.{ProfileView, FormatHelpers}

  def render("show.json", %{user: user}) do
    %{profile: render_one(user, ProfileView, "profile.json")}
  end

  def render("profile.json", %{profile: profile}) do
    profile
    |> Map.from_struct()
   
    |> Map.take([:username, :image, :bio])
    |> FormatHelpers.camelize()
  end
end
