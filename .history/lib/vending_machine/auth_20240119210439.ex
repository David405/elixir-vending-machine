# lib/vending_machine/auth.ex
defmodule VendingMachine.Auth do
  alias VendingMachine.Repo
  alias VendingMachine.User

  def authenticate(username, password) do
    query = from(user in User, where: u.username == ^username, select: [:id, :username, :password])

    case Repo.one(query) do
      nil -> {:error, "Invalid username"}
      %User{id: id, username: user_username, password: user_password} ->
        if user_password == password do
          {:ok, %User{id: id, username: user_username}}
        else
          {:error, "Invalid password"}
        end
    end
  end
end
