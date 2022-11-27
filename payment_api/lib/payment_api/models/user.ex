defmodule PaymentApi.Models.User do
  use PaymentApi.Schema
  import Ecto.Changeset
  alias PaymentApi.Models.Account

  @required_params [:nickname, :email]

  schema "users" do
    field :nickname, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    has_one :account, Account

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 4)
    |> unique_constraint(:email)
    |> unique_constraint(:nickname)
  end
end
