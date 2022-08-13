defmodule ProteinTranslation do
  @rna_catalog%{
      "UGU" => "Cysteine",
      "UGC" => "Cysteine",
      "UUA" => "Leucine",
      "UUG" => "Leucine",
      "AUG" => "Methionine",
      "UUU" => "Phenylalanine",
      "UUC" => "Phenylalanine",
      "UCU" => "Serine",
      "UCC" => "Serine",
      "UCA" => "Serine",
      "UCG" => "Serine",
      "UGG" => "Tryptophan",
      "UAU" => "Tyrosine",
      "UAC" => "Tyrosine",
      "UAA" => "STOP",
      "UAG" => "STOP",
      "UGA" => "STOP" }

  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna), do: do_of_rna(rna,[])

  defp do_of_rna(<<codon::binary-size(3), rest::binary>>, acc) do
    case of_codon(codon) do
      {:error, _} -> {:error, "invalid RNA"}
      {:ok, "STOP"} -> {:ok, acc}
      {:ok, protein} -> do_of_rna(rest, acc ++ [protein])
    end
  end

  defp do_of_rna("",acc), do: {:ok, acc}

  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    case Map.fetch(@rna_catalo, codon) do
      :error -> {:error, "invalid codon"}
      {:ok, _} = value -> value
    end
  end

end
