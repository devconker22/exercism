defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    Regex.replace(~r/\w+/, phrase, &translate_word/1)
  end

  defp translate_word(word) do
    if Regex.match?(~r/^(?:(y|x)[^aeiou]|[aeiou])/, word) do
      word <> "ay"
    else
      [start] = Regex.run(~r/^[^aeiouq]*qu|[^aeiou]+/, word)
      String.replace_leading(word, start, "") <> start <> "ay"
    end
  end
end
