defmodule ProteinTranslationWithMapTest do
  use ExUnit.Case

  # @tag :pending
  test "AUG translates to methionine" do
    assert ProteinTranslationWithMap.of_codon("AUG") == {:ok, "Methionine"}
  end

  # @tag :pending
  test "identifies Phenylalanine codons" do
    assert ProteinTranslationWithMap.of_codon("UUU") == {:ok, "Phenylalanine"}
    assert ProteinTranslationWithMap.of_codon("UUC") == {:ok, "Phenylalanine"}
  end

  # @tag :pending
  test "identifies Leucine codons" do
    assert ProteinTranslationWithMap.of_codon("UUA") == {:ok, "Leucine"}
    assert ProteinTranslationWithMap.of_codon("UUG") == {:ok, "Leucine"}
  end

  # @tag :pending
  test "identifies Serine codons" do
    assert ProteinTranslationWithMap.of_codon("UCU") == {:ok, "Serine"}
    assert ProteinTranslationWithMap.of_codon("UCC") == {:ok, "Serine"}
    assert ProteinTranslationWithMap.of_codon("UCA") == {:ok, "Serine"}
    assert ProteinTranslationWithMap.of_codon("UCG") == {:ok, "Serine"}
  end

  # @tag :pending
  test "identifies Tyrosine codons" do
    assert ProteinTranslationWithMap.of_codon("UAU") == {:ok, "Tyrosine"}
    assert ProteinTranslationWithMap.of_codon("UAC") == {:ok, "Tyrosine"}
  end

  # @tag :pending
  test "identifies Cysteine codons" do
    assert ProteinTranslationWithMap.of_codon("UGU") == {:ok, "Cysteine"}
    assert ProteinTranslationWithMap.of_codon("UGC") == {:ok, "Cysteine"}
  end

  # @tag :pending
  test "identifies Tryptophan codons" do
    assert ProteinTranslationWithMap.of_codon("UGG") == {:ok, "Tryptophan"}
  end

  # @tag :pending
  test "identifies stop codons" do
    assert ProteinTranslationWithMap.of_codon("UAA") == {:ok, "STOP"}
    assert ProteinTranslationWithMap.of_codon("UAG") == {:ok, "STOP"}
    assert ProteinTranslationWithMap.of_codon("UGA") == {:ok, "STOP"}
  end

  # @tag :pending
  test "translates rna strand into correct protein" do
    strand = "AUGUUUUGG"

    assert ProteinTranslationWithMap.of_rna(strand) ==
             {:ok, ~w(Methionine Phenylalanine Tryptophan)}
  end

  # @tag :pending
  test "stops translation if stop codon present" do
    strand = "AUGUUUUAA"

    assert ProteinTranslationWithMap.of_rna(strand) ==
             {:ok, ~w(Methionine Phenylalanine)}
  end

  # @tag :pending
  test "stops translation of longer strand" do
    strand = "UGGUGUUAUUAAUGGUUU"

    assert ProteinTranslationWithMap.of_rna(strand) ==
             {:ok, ~w(Tryptophan Cysteine Tyrosine)}
  end

  # @tag :pending
  test "invalid RNA" do
    assert ProteinTranslationWithMap.of_rna("CARROT") == {:error, "invalid RNA"}
  end

  # @tag :pending
  test "invalid codon at end of RNA" do
    assert ProteinTranslationWithMap.of_rna("UUUROT") == {:error, "invalid RNA"}
  end

  # @tag :pending
  test "invalid codon" do
    assert ProteinTranslationWithMap.of_codon("INVALID") == {:error, "invalid codon"}
  end
end
