defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    baseSort= base |> String.downcase |> String.graphemes |> Enum.sort
    candidates |> Enum.filter(fn x -> x |> String.downcase != base |> String.downcase end)
    |> Enum.filter( fn x -> x|>String.downcase|>String.graphemes |> Enum.sort == baseSort end)
  end
end
