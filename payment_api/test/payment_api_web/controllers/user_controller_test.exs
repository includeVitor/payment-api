defmodule PaymentApiWeb.UserControllerTest do
  use PaymentApiWeb.ConnCase, async: true
  alias PaymentApi.Models.{Account, User}

  describe "create" do
    test "should be able to create an user", %{conn: conn} do
      params = %{
        nickname: "includevitor",
        email: "includevitor@email.com"
      }

      response =
        conn
        |> post(Routes.user_path(conn, :create, params))
        |> json_response(:created)

      %{
        "user" => %{
          "account" => %{
            "id" => account_id
          },
          "id" => user_id
        }
      } = response

      expected_response = %{
        "message" => "User created",
        "user" => %{
          "account" => %{
            "balance" => "0.00",
            "id" => account_id
          },
          "email" => "includevitor@email.com",
          "id" => user_id,
          "nickname" => "includevitor"
        }
      }

      assert expected_response === response
    end
  end
end
