defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  # upper ?A..?Z
  # lower ?a..?z
  # @lower  ?a..?z
  # @upper  ?A..?Z
# RTL

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> to_charlist()
    |> Enum.map(fn(char) -> rotateChar(char,shift) end)
    # or
    # |> Enum.map(&(rotateChar(&1,shift)))
    |> to_string()

  end

  # def rotate(text, shift) do
  #   resulttochar= to_charlist(text)
  #   resultMap= Enum.map(resulttochar,fn(char) -> rotateChar(char,shift) end)
  #   finalresult= to_string(resultMap)
  # end


  defp rotateChar(c, r) do
    cond do
      (c in ?a..?z) -> ?a + rem(c - ?a + r,26)
      (c in ?A..?Z) -> ?A + rem(c - ?A + r,26)
      true -> c
    end
  end
end
