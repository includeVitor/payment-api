defmodule PaymentApi.UseCases.User.CreateTest do
  use PaymentApi.DataCase, async: true
  alias PaymentApi.Models.User
  alias PaymentApi.UseCases.User.Create

  describe "call/1" do
    test "should be able to create an user" do
      params = %{
        nickname: "includevitor",
        email: "includevitor@email.com"
      }

      {:ok, %User{id: user_id}} = Create.call(params)

      user = Repo.get(User, user_id)

      assert %User{nickname: "includevitor", email: "includevitor@email.com", id: ^user_id} = user
    end

    test "should be able to handle invalid params" do
      params = %{
        nickname: "",
        email: ""
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        nickname: ["can't be blank"],
        email: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
