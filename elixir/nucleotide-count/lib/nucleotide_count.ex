defmodule NucleotideCount do

  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples
  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    strand
    |> Enum.count(fn x->x==nucleotide end)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    Map.new(@nucleotides, fn x-> {x,count(strand,x)} end)
    # or
    # strand
    # |> Enum.reduce(%{?A => 0, ?T => 0, ?C => 0, ?G => 0}, fn x, map -> Map.update(map, x, 1, fn y -> y+1 end) end)
  end
end