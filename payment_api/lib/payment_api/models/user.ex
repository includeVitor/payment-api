defmodule PaymentApi.Models.User do
  use Ecto.Migration
  import Ecto.Changeset
  alias PaymentApi.Models.Account

  @primary_key {:id, :binary_id, autogenerate:true}

  @required_params {:nickname, :email}

  schema "users" do
    field :nickname, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    has_one :account, Account

    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 4)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> unique_constraint(:nickname)
  end
end
