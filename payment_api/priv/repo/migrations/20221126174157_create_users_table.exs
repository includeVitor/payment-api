defmodule PaymentApi.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table :users, primary_key: false do
      add :id, :uuid, primary_key: true
      add :nickname, :string
      add :email, :string
      add :password_hash, :string

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:nickname])
  end
end
