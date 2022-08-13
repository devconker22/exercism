defmodule MatchingBrackets do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    str
    |> String.codepoints()
    |> Enum.reduce([], fn x, acc -> check(x, acc) end)
    |> Enum.empty?
  end

  def check("(", list), do: ["(" | list]
  def check("[", list), do: ["[" | list]
  def check("{", list), do: ["{" | list]
  def check(")", [h | t]) when h == "(", do: t
  def check("]", [h | t] ) when h == "[", do: t
  def check("}", [h | t]) when h == "{", do: t
  def check(")", [h | t]) when h != "(", do: [")", h | t]
  def check("]", [h | t]) when h != "[", do: ["]", h | t]
  def check("}", [h | t]) when h != "{", do: ["}", h | t]
  def check(_, list), do: list

end
