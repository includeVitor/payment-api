defmodule PaymentApiWeb.AccountView do
  alias PaymentApi.Models.Account
  alias PaymentApi.UseCases.Account.Dto.TransactionResponse, as: TransactionResponse

  def render("patch.json", %{account: %Account{id: account_id, balance: balance}}) do
    %{
      message: "Balance patched successfully",
      account: %{
        id: account_id,
        balance: balance
      }
    }
  end

end
