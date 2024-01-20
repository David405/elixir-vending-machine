defmodule VendingMachine.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `VendingMachine.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        deposit: 42,
        password: "some password",
        role: "some role",
        username: "some username"
      })
      |> VendingMachine.Accounts.create_user()

    user
  end
end
