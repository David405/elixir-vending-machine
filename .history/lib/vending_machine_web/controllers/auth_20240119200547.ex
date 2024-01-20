# web/auth.ex

defmodule VendingMachineWeb.Auth do
  import Guardian.JWT
  alias VendingMachineWeb.Guardian

  def encode_and_sign(resource) do
    resource
    |> Guardian.encode_and_sign()
  end

  def decode_and_verify(token) do
    Guardian.decode_and_verify(token)
  end
end
