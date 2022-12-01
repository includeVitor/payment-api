defmodule PaymentApi.UseCases.User.GetUsers do
  alias PaymentApi.Models.User
  alias PaymentApi.Repo

  def call(params) do
    get_users()
  end

  def get_users() do
    case Repo.all(User) do
      nil -> {:error, "Theres no users yet, create one!"}
      users -> {:ok, users}
    end
  end
end
