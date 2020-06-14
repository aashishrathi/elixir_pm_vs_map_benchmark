defmodule ProteinTranslationWithPatterMatching do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    of_rna(rna, [])
  end

  defp of_rna("", translated_proteins_reversed),
    do: {:ok, Enum.reverse(translated_proteins_reversed)}

  defp of_rna(<<codon::binary-3, remaining_codons::binary>>, translated_proteins) do
    case of_codon(codon) do
      {:ok, "STOP"} -> of_rna("", translated_proteins)
      {:ok, protein} -> of_rna(remaining_codons, [protein | translated_proteins])
      {:error, _} -> {:error, "invalid RNA"}
    end
  end

  defp of_rna(_, _), do: {:error, "invalid RNA"}

  @cysteine_codons ["UGU", "UGC"]
  @leucine_codons ["UUA", "UUG"]
  @methionine_codons ["AUG"]
  @phenylalanine_codons ["UUU", "UUC"]
  @serine_codons ["UCU", "UCC", "UCA", "UCG"]
  @tryptophan_codons ["UGG"]
  @tyrosine_codons ["UAU", "UAC"]
  @stop_codons ["UAA", "UAG", "UGA"]

  @doc """
  Given a codon, return the corresponding protein

  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) when codon in @cysteine_codons, do: {:ok, "Cysteine"}
  def of_codon(codon) when codon in @leucine_codons, do: {:ok, "Leucine"}
  def of_codon(codon) when codon in @methionine_codons, do: {:ok, "Methionine"}
  def of_codon(codon) when codon in @phenylalanine_codons, do: {:ok, "Phenylalanine"}
  def of_codon(codon) when codon in @serine_codons, do: {:ok, "Serine"}
  def of_codon(codon) when codon in @tryptophan_codons, do: {:ok, "Tryptophan"}
  def of_codon(codon) when codon in @tyrosine_codons, do: {:ok, "Tyrosine"}
  def of_codon(codon) when codon in @stop_codons, do: {:ok, "STOP"}
  def of_codon(_), do: {:error, "invalid codon"}
end
