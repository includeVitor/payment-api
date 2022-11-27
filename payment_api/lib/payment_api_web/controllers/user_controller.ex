defmodule PaymentApiWeb.UserController do
  use PaymentApiWeb, :controller
  alias PaymentApi.Models.User

  action_fallback PaymentApiWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- PaymentApi.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
