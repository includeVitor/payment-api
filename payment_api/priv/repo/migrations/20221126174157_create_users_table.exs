defmodule PaymentApi.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table :users do
      add :nickname, :string
      add :email, :string
      add :password_hash, :string

      timestamps()
    end

    create_unique_index(:users, [:email])
    create_unique_index(:users, [:nickname])
  end
end