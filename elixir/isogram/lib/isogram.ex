defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean

  def isogram?(sentence) do
   sentenceFormated= ~r([a-zA-Z]) |> Regex.scan(sentence)
   Enum.uniq(sentenceFormated) == sentenceFormated
  end
end
