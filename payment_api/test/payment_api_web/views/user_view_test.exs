defmodule PaymentApiWeb.UserViewTest do
  use PaymentApiWeb.ConnCase, async: true
  import Phoenix.View
  alias PaymentApi.Models.{User, Account}
  alias PaymentApiWeb.UserView

  test "renders create.json" do
    params = %{
      nickname: "includevitor",
      email: "includevitor@email.com"
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      PaymentApi.create_user(params)

    response = render(UserView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        id: user_id,
        nickname: "includevitor",
        email: "includevitor@email.com",
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
        }
      }
    }

    assert expected_response == response
  end
end
