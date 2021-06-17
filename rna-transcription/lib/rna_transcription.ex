defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna_nucleotide_map = %{
      :g => "c",
      :c => "g",
      :t => "a",
      :a => "u"
    }

    # formats charlist input to iterable list
    dna =
      List.to_string(dna)
      |> String.split("")
      |> Enum.filter(fn value -> value !== "" end)
      |> Enum.map(fn value -> String.downcase(value) end)

    # throw away values that are not in the map
    dna =
      Enum.filter(dna, fn value -> Map.get(dna_nucleotide_map, String.to_atom(value)) !== nil end)

    # map to rna
    rna = Enum.map(dna, fn value -> Map.get(dna_nucleotide_map, String.to_atom(value)) end)

    # format to desired output
    Enum.join(rna, "") |> String.upcase() |> String.to_charlist()
  end
end
