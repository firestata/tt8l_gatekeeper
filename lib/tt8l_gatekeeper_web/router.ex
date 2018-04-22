defmodule Tt8lGatekeeperWeb.Router do
  use Tt8lGatekeeperWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Tt8lGatekeeperWeb do
    pipe_through :api
  end
end
