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

  def render("users.json", %{users: users}) do
    list =
      Enum.map(users, fn user ->
        %{id: user.id, nickname: user.nickname, email: user.email}
      end)

    %{
      data: list
    }
  end
end
