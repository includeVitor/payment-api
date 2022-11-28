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

    test "should be able to handle invalid params while making an deposit", %{
      conn: conn,
      account_id: account_id
    } do
      params = %{"value" => "not an number"}

      response =
        conn
        |> patch(Routes.account_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid value!"}

      assert expected_response == response
    end
  end

  describe "withdraw" do
    setup %{conn: conn} do
      params_user = %{
        nickname: "includevitor",
        email: "includevitor@email.com"
      }

      {:ok, %User{account: %Account{id: account_id}}} = PaymentApi.create_user(params_user)

      PaymentApi.deposit(%{"id" => account_id, "value" => "50.00"})

      {:ok, conn: conn, account_id: account_id}
    end

    test "should be able to make an withdraw", %{conn: conn, account_id: account_id} do
      params = %{"value" => "25.04"}

      response =
        conn
        |> patch(Routes.account_path(conn, :withdraw, account_id, params))
        |> json_response(:ok)

      expected_response = %{
        "account" => %{"balance" => "24.96", "id" => account_id},
        "message" => "Balance patched successfully"
      }

      assert expected_response === response
    end

    test "should be able to handle invalid params while making an withdraw", %{
      conn: conn,
      account_id: account_id
    } do
      params = %{"value" => "not an number"}

      response =
        conn
        |> patch(Routes.account_path(conn, :withdraw, account_id, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid value!"}

      assert expected_response == response
    end
  end

  describe "transaction" do
    setup %{conn: conn} do
      params_from_user = %{
        nickname: "includevitor",
        email: "includevitor@email.com"
      }

      {:ok, %User{account: %Account{id: from}}} = PaymentApi.create_user(params_from_user)

      PaymentApi.deposit(%{"id" => from, "value" => "50.00"})

      params_to_user = %{
        nickname: "includedaniel",
        email: "includedaniel@email.com"
      }

      {:ok, %User{account: %Account{id: to}}} = PaymentApi.create_user(params_to_user)

      PaymentApi.deposit(%{"id" => to, "value" => "50.00"})

      {:ok, conn: conn, from: from, to: to}
    end

    test "should be able to make an transaction", %{conn: conn, from: from, to: to} do
      params = %{"from" => from, "to" => to, "value" => "25.04"}

      response =
        conn
        |> patch(Routes.account_path(conn, :transaction, params))
        |> json_response(:ok)

      expected_response = %{
        "account" => %{
          "from_account" => %{
            "balance" => "24.96",
            "id" => from
          },
          "to_account" => %{
            "balance" => "75.04",
            "id" => to
          }
        },
        "message" => "Transaction processed successfully"
      }

      assert expected_response === response
    end

    test "should be able to handle invalid params while making an transaction", %{
      conn: conn,
      from: from,
      to: to
    } do
      params = %{"from" => from, "to" => to, "value" => "not an number"}

      response =
        conn
        |> patch(Routes.account_path(conn, :transaction, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid value!"}

      assert expected_response == response
    end
  end
end
