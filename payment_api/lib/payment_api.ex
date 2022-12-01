defmodule PaymentApi do
  alias PaymentApi.UseCases.User.Create, as: CreateUser
  alias PaymentApi.UseCases.User.GetUsers
  alias PaymentApi.UseCases.Account.{Deposit, Withdraw, Transaction}

  # /users
  defdelegate create_user(params), to: CreateUser, as: :call
  defdelegate get_users(params), to: GetUsers, as: :call

  # /accounts
  defdelegate deposit(params), to: Deposit, as: :call
  defdelegate withdraw(params), to: Withdraw, as: :call
  defdelegate transaction(params), to: Transaction, as: :call
end
