Benchee.run(%{
  "of_rna_pm" => fn ->
    ProteinTranslationWithPatterMatching.of_rna(
      "UGUUGCUUAUUGAUGUUUUUCUCUUCCUCAUCGUGGUAUUACUAAUAGUGA"
    )
  end,
  "of_rna_map" => fn ->
    ProteinTranslationWithMap.of_rna("UGUUGCUUAUUGAUGUUUUUCUCUUCCUCAUCGUGGUAUUACUAAUAGUGA")
  end
})
