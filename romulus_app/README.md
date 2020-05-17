# Romulus App

Romulus App that provides account registration feature for Romulus Mesagging Application.

## Installing / Getting started

To run this project, you will need to install the following dependencies on your system:

* [Elixir](https://elixir-lang.org/install.html)
* [Phoenix](https://hexdocs.pm/phoenix/installation.html)
* [PostgreSQL](https://www.postgresql.org/download/macosx/)

To get started, run the following commands in your project folder:

```shell
cp config/dev.exs.example config/dev.exs  # creates the project's configuration file
mix deps.get  # installs the dependencies
mix ecto.create  # creates the database.
mix ecto.migrate  # run the database migrations.
mix que.setup # If you are using persistence option for que job processing
mix phx.server  # run the application.
OR
iex -S mix phx.server # run the application in iex
```

This is a backend project, you won't be able to go to localhost:4000 and see an aplication. 

In order to see the [Romulus UI](romulus_ui) frontend you will need to download and setup.

## Tests

To run the tests for this project, simply run in your terminal:

```shell
mix test
```

## Documentation

To generate the documentation, your can run in your terminal:

```shell
mix docs
```

This will generate a `doc/` directory with a documentation in HTML. To view the documentation, open the `index.html` file in the generated directory.

### Ecto Docs

https://hexdocs.pm/ecto/Ecto.html

### Stop postgresql

brew services stop postgresql

### Start postgresql in docker

docker run --name some-postgres -p 5432:5432 -v postgres-data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=postgres -d postgres

### Help with Docker & Postgres

https://markheath.net/post/exploring-postgresql-with-docker

### Working with a repo

mix ecto.create -r Todos.Repo

mix ecto.migrate -r Todos.Repo

mix ecto.drop -r Todos.Repo

Insert some sample data before write our api resource

Romulus.Repo.insert!(%Romulus.Todo{item: "Hello1"}) 

Add a new column to todo table with an ecto migration

Romulus.Repo.insert!(%Romulus.Todo{item: "Hello1", title: "test"}) 

Seeding data

https://www.phoenixframework.org/blog/seeding-data
