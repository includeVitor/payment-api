defmodule PaymentApiWeb.AccountController do
  use PaymetApiWeb, :controller
  alias PaymentApi.Models.Account
  alias PaymentApi.UseCases.Account.Dto.TransactionResponse, as: TransactionResponse

  action_fallback PaymentApiWeb.FallbackController

  def deposit (conn, params) do
    with {:ok, %Account{} = account} <- PaymentApiWeb.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

end
