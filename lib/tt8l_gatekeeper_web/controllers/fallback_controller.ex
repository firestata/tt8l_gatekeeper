defmodule Tt8lGatekeeperWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use Tt8lGatekeeperWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(Tt8lGatekeeperWeb.ChangesetView, "error.json", changeset: changeset)
  end

  def call(conn, {:error, :login_failed}), do: login_failed(conn)
  def call(conn, {:error, :login_not_found}), do: login_failed(conn)

  def login_failed(conn) do
    conn
    |> put_status(201)
    |> render(Tt8lGatekeeperWeb.ErrorView, "error.json", status: :unauthorized, message: "Authentication failed!")
  end

end
