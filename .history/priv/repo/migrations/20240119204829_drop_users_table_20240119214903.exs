defmodule VendingMachine.Repo.Migrations.DropUsersTable do
  use Ecto.Migration

  def change do
    drop("users")
  end
end
