defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(~R/[^[:alnum:]-]/u, trim: true)
    |> Enum.reduce(%{}, fn x, map -> Map.update(map, x , 1 , fn z-> z+1 end) end)
  end
end
