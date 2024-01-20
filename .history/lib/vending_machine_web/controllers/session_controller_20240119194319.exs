# lib/vending_machine_web/controllers/session_controller.ex

defmodule VendingMachineWeb.SessionController do
  use VendingMachineWeb, :controller

  alias VendingMachine.Accounts

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"username" => username, "password" => password}) do
    case Accounts.authenticate_user(username, password) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Successfully logged in.")
        |> put_session(:user_id, user.id)
        |> redirect(to: page_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Invalid username or password.")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: page_path(conn, :index))
  end
end
