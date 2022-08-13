defmodule RomanNumerals do

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    numeral(number,"");
  end

  def romanNumberToInteger(s) do
    s |> String.split()
  end

  defp numeral(0,acc), do: acc

  defp numeral(n,acc) when n in 1..3, do: numeral(n-1, acc <> "I")
  defp numeral(n,acc) when n === 4, do: numeral(n-4, acc <> "IV")
  defp numeral(n,acc) when n in 5..8, do: numeral(n-5, acc <> "V")
  defp numeral(n,acc) when n === 9, do: numeral(n-9, acc <> "IX")
  defp numeral(n,acc) when n in 10..39, do: numeral(n-10, acc <> "X")
  defp numeral(n,acc) when n in 40..49, do: numeral(n-40, acc <> "XL")

  defp numeral(n,acc) when n in 50..89, do: numeral(n-50, acc <> "L")
  defp numeral(n,acc) when n in 90..99, do: numeral(n-90, acc <> "XC")
  defp numeral(n,acc) when n in 100..399, do: numeral(n-100, acc <> "C")
  defp numeral(n,acc) when n in 400..499, do: numeral(n-400, acc <> "CD")
  defp numeral(n,acc) when n in 500..899, do: numeral(n-500, acc <> "D")
  defp numeral(n,acc) when n in 900..999, do: numeral(n-900, acc <> "CM")
  defp numeral(n,acc) when n >=1000, do: numeral(n-1000, acc <> "M")

end
