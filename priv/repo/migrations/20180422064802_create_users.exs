defmodule Tt8lGatekeeper.Repo.Migrations.CreateTt8lGatekeeper.Accounts.User do
  use Ecto.Migration

  def change do
    create table(:accounts_users, primary_key: false) do
      add :id,            :binary_id, primary_key: true
      add :email,         :string,    null: false
      add :name,          :string,    null: false
      add :password_hash, :string,    null: false
    end

    create unique_index(:accounts_users, [:email])
  end
end
