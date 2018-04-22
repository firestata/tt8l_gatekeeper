defmodule Tt8lGatekeeperWeb.Router do
  use Tt8lGatekeeperWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
  end

  pipeline :authenticated do
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/api/v1", Tt8lGatekeeperWeb do
    pipe_through :api

    pipe_through :authenticated
    resources "/users", UserController, except: [:new, :edit]
  end
end
