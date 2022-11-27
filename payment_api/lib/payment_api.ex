defmodule PaymentApi do
  alias PaymentApi.UseCases.User.Create, as: UserCreate
  defdelegate create_user(params), to: UserCreate, as: :call
end
