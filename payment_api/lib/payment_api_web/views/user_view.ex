defmodule PaymentApiWeb.UserView do
  alias PaymentApi.Models.{User, Account}

  def render("create.json", %{
        user: %User{
          account: %Account{id: account_id, balance: balance},
          id: id,
          nickname: nickname,
          email: email
        }
      }) do
    %{
      message: "User created",
      user: %{
        id: id,
        nickname: nickname,
        email: email,
        account: %{
          id: account_id,
          balance: balance
        }
      }
    }
  end
end
