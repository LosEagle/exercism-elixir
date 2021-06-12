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

    IO.puts('post-format')
    IO.inspect(dna)

    # throw away values that are not in the map
    dna =
      Enum.filter(dna, fn value -> Map.get(dna_nucleotide_map, String.to_atom(value)) !== nil end)

    IO.puts('post-clean')
    IO.inspect(dna)

    # map to rna
    rna = Enum.map(dna, fn value -> Map.get(dna_nucleotide_map, String.to_atom(value)) end)

    IO.puts('post-rna-map')
    IO.inspect(rna)

    # format to desired output
    Enum.join(rna, "") |> String.upcase() |> String.to_charlist()
  end
end
