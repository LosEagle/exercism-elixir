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
      ?G => ?C,
      ?C => ?G,
      ?T => ?A,
      ?A => ?U
    }

    Enum.map(dna, fn char -> dna_nucleotide_map[char] end)
  end
end
