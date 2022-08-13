defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list), do: flattenList(list,[]) |> Enum.filter(& !is_nil(&1))
  def flattenList([h | t], acc) when h == [], do: flattenList(t, acc)
  def flattenList([h | t], acc) when is_list(h), do: flattenList(h, flattenList(t, acc))
  def flattenList([h | t], acc), do: [h | flattenList(t, acc)]
  def flattenList([], acc), do: acc
end
