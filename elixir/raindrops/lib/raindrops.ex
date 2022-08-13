defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    ""
    |> convert_pling(number)
    |> convert_plang(number)
    |> convert_plong(number)
    |> default(number)

  end

  defp convert_pling(str,number) when rem(number,3) == 0, do: str <> "Pling"
  defp convert_pling(str,_), do: str

  defp convert_plang(str,number) when rem(number,5) == 0, do: str <> "Plang"
  defp convert_plang(str,_), do: str

  defp convert_plong(str, number) when rem(number,7) == 0, do: str <> "Plong"
  defp convert_plong(str,_), do: str


  defp default("",number), do:  Integer.to_string(number)
  defp default(srt,_),  do: srt

end
