defmodule IsbnVerifier do
  @doc """
    Checks if a string is a valid ISBN-10 identifier

    ## Examples

      iex> ISBNVerifier.isbn?("3-598-21507-X")
      true

      iex> ISBNVerifier.isbn?("3-598-2K507-0")
      false

  """
  @spec isbn?(String.t()) :: boolean
  def isbn?(isbn) do
    isbn = isbn |> String.replace("-", "")
    if String.length(isbn) == 10 and isbn =~ ~r/[0-9]{9}([0-9]|X)/ do
      rm = isbn
      |> String.split("", trim: true)
      |> Enum.map(fn x -> if x == "X", do: 10, else: String.to_integer(x) end)
      |> Enum.zip(10..1)
      |> Enum.map(fn {x, y} -> x * y end)
      |> Enum.sum
      |> rem(11)
      rm == 0
    else
      false
    end
  end
end
