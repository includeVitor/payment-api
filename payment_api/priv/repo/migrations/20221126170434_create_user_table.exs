defmodule PaymentApi.Repo.Migrations.CreateUserTable do
  use Ecto.Schema
  use Ecto.Migration

  schema "users" do
    field :nickname, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  def changeset(user, param \\ %{}) do
    user
    |> cast(params, [:nickname, :email])
    |> validate_required([:nickname, :email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end
end
