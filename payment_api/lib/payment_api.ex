defmodule PaymentApi do
  alias PaymentApi.UseCases.User.Create, as: UserCreate
  alias PaymentApi.UseCases.Account.{Deposit, Withdraw}

  # /users
  defdelegate create_user(params), to: UserCreate, as: :call

  # /accounts
  defdelegate deposit(params), to: Deposit, as: :call
  defdelegate withdraw(params), to: Withdraw, as: :call
end
