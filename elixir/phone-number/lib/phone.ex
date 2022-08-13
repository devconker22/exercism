defmodule Phone do

  @spec number(String.t()) :: String.t()
  def number(raw) do
    raw
    |> String.replace(~r/[[:punct:][:space:]]/u, "")
    |> String.trim_leading("1")
    |> valid?()
    |> case do
      {true, unpunct} -> unpunct
      _ -> "0000000000"
    end
  end

  defp valid?(unpunct), do: {String.match?(unpunct, ~r/^[2-9]\d\d[2-9][\d]{6}$/u), unpunct}


  @spec area_code(String.t()) :: String.t()
  def area_code(raw), do: String.slice(number(raw), 0..2)

  @spec pretty(String.t()) :: String.t()
  def pretty(raw) do
    a = area_code(raw)
    b = String.slice(number(raw), 3..5)
    c = String.slice(number(raw), 6..9)
    "(#{a}) #{b}-#{c}"
  end
end
