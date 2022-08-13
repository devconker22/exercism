defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([nil],[]), do: :superlist
  def compare([],[nil]), do: :sublist
  def compare(a, b) when a == b, do: :equal

  def compare(a, b) when length(a) < length(b), do: do_compare(a,Enum.chunk_every(b,length(a),1), :sublist)

  def compare(a, b), do: do_compare(b,Enum.chunk_every(a,length(b),1), :superlist)

  defp do_compare(x,[h|_],message) when x === h, do: message
  defp do_compare(x,[_|t],message), do: do_compare(x,t,message)
  defp do_compare(_,[],_), do: :unequal
end
