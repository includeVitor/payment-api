defmodule PaymentApiWeb.UserController do
  use PaymentApiWeb, :controller
  alias PaymentApi.Models.User

  action_fallback(PaymentApiWeb.FallbackController)

  def get_users(conn, params) do
    with {:ok, users} <- PaymentApi.get_users(params) do
      conn
      |> put_status(:ok)
      |> render("users.json", users: users)
    end
  end

  def create(conn, params) do
    with {:ok, %User{} = user} <- PaymentApi.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
