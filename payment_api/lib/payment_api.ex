defmodule PaymentApi do
  alias PaymentApi.UseCases.User.Create, as: UserCreate
  alias PaymentApi.UseCases.Account.Deposit

  # /users
  defdelegate create_user(params), to: UserCreate, as: :call

  # /accounts
  defdelegate deposit(params), to: Deposit, as: :call
end
