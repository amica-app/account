defmodule AddAccount do
  use Que.Worker, concurrency: 4

  def perform(user) do
    # todo get this from an env var
    resp = HTTPoison.post!("http://localhost:8088/apiadmin/users/localhost",Poison.encode!(%{"username" => user["username"], "password" => user["password"]}), [{"Content-Type", "application/json"}] )
    %{body: body} = resp
    IO.puts "XMPP account status #{resp.body} #{resp.status_code}"
  end

  # handle error conditions or retry if the status isn't 201

  # HTTPoison.post "http://localhost:8088/apiadmin/users/localhost", Poison.encode!(%{"username" => "asdf", "password" => "test"}), [{"Content-Type", "application/json"}] 
end