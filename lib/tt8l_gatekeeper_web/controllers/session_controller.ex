defmodule Tt8lGatekeeperWeb.SessionController do
  use Tt8lGatekeeperWeb, :controller

  alias Tt8lGatekeeper.Accounts.User

  def sign_in(conn, %{"session" => %{"email" => email, "password" => pass}}) do
    with {:ok, user} <- User.find_and_confirm_password(email, pass),
         {:ok, jwt, _full_claims} <- Guardian.encode_and_sign(user, :api),
    do: render(conn, "sign_in.json", user: user, jwt: jwt)
  end

end
