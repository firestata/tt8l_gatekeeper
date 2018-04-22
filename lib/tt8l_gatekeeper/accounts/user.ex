defmodule Tt8lGatekeeper.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tt8lGatekeeper.Accounts.User

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do
    field :email,                 :string
    field :name,                  :string
    field :password,              :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :password_hash,         :string
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :name, :password])
    |> validate_required([:email, :name, :password])
    |> validate_changeset
  end

  def registration_changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :name, :password])
    |> validate_required([:email, :name, :password])
    |> validate_changeset
  end

  def validate_changeset(user) do
    user
    |> validate_length(:email, min: 5, max: 255)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> validate_length(:password, min: 8)
    |> validate_format(:password, ~r/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).*/, [message: "Must include at least at least one lowercase letter, one uppercase letterm, and one digit"])
    |> generate_password_hash
  end

  def generate_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(password))
      _ ->
        changeset
    end

  end

end
