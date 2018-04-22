defmodule Tt8lGatekeeperWeb.RegistrationController do
  use Tt8lGatekeeperWeb, :controller

  alias Tt8lGatekeeper.{Accounts, Accounts.User}

  action_fallback Tt8lGatekeeperWeb.FallbackController

  def sign_up(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.register_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", user_path(conn, :show, user))
      |> render("sucess.json", user: user)
    end
  end

end
