defmodule RunLengthEncoder do

  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string), do: encode_p(string |> to_charlist(), 1, []) |> List.to_string()

  defp encode_p([h1,h2|t], x, acc) when h1 == h2, do: encode_p([h2|t], x+1, acc)

  defp encode_p([h1,h2|t], x, acc) when x > 1, do: encode_p([h2|t], 1, [acc,x |> Integer.to_string ,h1])

  defp encode_p([h1|t], x, acc) when x > 1, do: encode_p([t], 1, [acc,x |> Integer.to_string ,h1])

  defp encode_p([h1|t], x, acc), do: encode_p(t, 1, acc ++ [h1] )

  defp encode_p([], _, acc), do: acc

  # [
  #   ["12W", "12", "W"],
  #   ["B", "", "B"],
  #   ["12W", "12", "W"],
  #   ["3B", "3", "B"],
  #   ["24W", "24", "W"],
  #   ["B", "", "B"]
  # ]

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    ~r/([[:digit:]]+)?(.)/
    |> Regex.scan(string, capture: :all_but_first)
    |> Enum.map(&decode_p/1)
    |> Enum.join()
  end

  defp decode_p(["",s]), do: s

  defp decode_p([n,s]), do: String.duplicate(s, n  |> String.to_integer)

end
