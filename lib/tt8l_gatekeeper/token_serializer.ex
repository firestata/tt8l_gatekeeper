defmodule Tt8lGatekeeper.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias Tt8lGatekeeper.Repo
  alias Tt8lGatekeeper.Accounts.User

  def for_token(user = %{}), do: {:ok, "User:#{user.id}"}
  def for_token(_), do: {:error, "Unknown resource type"}

  def for_token("User:" <> id), do: {:ok, Repo.get(User, id)}
  def for_token(_), do: {:error, "Unknown resource type"}
end
