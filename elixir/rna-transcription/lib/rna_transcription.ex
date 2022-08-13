defmodule RnaTranscription do


  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna_to_rna = %{?G => ?C, ?C => ?G, ?T => ?A, ?A => ?U }
    dna
    |> Enum.map(fn x-> dna_to_rna[x] end)
    # or
    # dna |> Enum.map(&(dna_to_rna[&1]))
  end


end
