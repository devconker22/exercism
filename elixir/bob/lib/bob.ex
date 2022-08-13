defmodule Bob do

  def hey(input) do
    input = String.trim(input)
    cond do
      isEmpty?(input) -> "Fine. Be that way!"
      shouting?(input) && isAsking?(input) -> "Calm down, I know what I'm doing!"
      isAsking?(input) -> "Sure."
      shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp isEmpty?(input), do: input == ""

  defp isAsking?(input), do: String.ends_with?(input, "?")

  defp shouting?(input) do
    has_lower = String.downcase(input) == input
    has_upper = String.upcase(input) == input
    not has_lower and has_upper
  end
end
