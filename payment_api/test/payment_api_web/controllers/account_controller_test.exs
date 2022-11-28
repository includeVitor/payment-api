defmodule PaymentApiWeb.AccountControllerTest do
  use PaymentApiWeb.ConnCase, async: true
  alias PaymentApi.Models.{Account, User}

  describe "deposit" do
    setup %{conn: conn} do
      params = %{
        nickname: "includevitor",
        email: "includevitor@email.com"
      }

      {:ok, %User{account: %Account{id: account_id}}} = PaymentApi.create_user(params)

      {:ok, conn: conn, account_id: account_id}
    end

    test "should be able to make an deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> patch(Routes.account_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      expected_response = %{
        "account" => %{"balance" => "50.00", "id" => account_id},
        "message" => "Balance patched successfully"
      }

      assert expected_response === response
    end
  end
end
