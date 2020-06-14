defmodule ProteinTranslationWithMap do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    of_rna(rna, [])
  end

  defp of_rna("", proteins), do: {:ok, Enum.reverse(proteins)}

  defp of_rna(<<codon::binary-3, rest::binary>>, proteins) do
    case of_codon(codon) do
      {:ok, "STOP"} -> of_rna("", proteins)
      {:ok, protein} -> of_rna(rest, [protein | proteins])
      {:error, _} -> {:error, "invalid RNA"}
    end
  end

  defp of_rna(_, _), do: {:error, "invalid RNA"}

  @codon_to_protein %{
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
    "UGA" => "STOP"
  }

  @doc """
  Given a codon, return the corresponding protein

  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    case Map.fetch(@codon_to_protein, codon) do
      {:ok, value} -> {:ok, value}
      :error -> {:error, "invalid codon"}
    end
  end
end
