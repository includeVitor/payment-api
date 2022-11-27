defmodule PaymentApiWeb.AccountController do
  use PaymentApiWeb, :controller
  alias PaymentApi.Models.Account
  alias PaymentApi.UseCases.Account.Dto.TransactionResponse, as: TransactionResponse

  action_fallback PaymentApiWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- PaymentApi.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("patch.json", account: account)
    end
  end

end
