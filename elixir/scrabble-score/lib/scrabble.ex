defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """

  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word |> String.upcase() |> String.graphemes() |> do_score(0)
    Enum.reduce()
  end
  defp do_score([h|t],acc) when h in ~w(A E I O U L N R S T), do: do_score(t,acc+1)
  defp do_score([h|t],acc) when h in ~w(D G), do: do_score(t,acc+2)
  defp do_score([h|t],acc) when h in ~w(B C M P), do: do_score(t,acc+3)
  defp do_score([h|t],acc) when h in ~w(F H V W Y), do: do_score(t,acc+4)
  defp do_score([h|t],acc) when h in ~w(K), do: do_score(t,acc+5)
  defp do_score([h|t],acc) when h in ~w(J X) , do: do_score(t,acc+8)
  defp do_score([h|t],acc) when h in ~w(Q Z) , do: do_score(t,acc+10)
  defp do_score([h|t],acc), do: do_score(t,acc)
  defp do_score([],acc),  do: acc
end
