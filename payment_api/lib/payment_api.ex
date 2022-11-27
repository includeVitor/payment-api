defmodule PaymentApi do
  alias PaymentApi.UseCases.User.Create, as: UserCreate
  alias PaymentApi.UseCases.Account.{Deposit}

  # /Users
  defdelegate create_user(params), to: UserCreate, as: :call

  # /Account
  defdelegate deposit(params), to: Deposit, as: :call
end
