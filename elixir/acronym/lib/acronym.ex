defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    ~r/\b[[:alpha:]]|[[:upper:]](?=[[:lower:]])/
    |>Regex.scan(string |> String.replace(~r/[[:punct:]]/,""))
    |>Enum.join()
    |>String.upcase()
  end
end
