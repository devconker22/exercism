defmodule ResistorColor do
  @moduledoc false
  @color_list ~w(black brown red orange yellow green blue violet grey white)

  @spec colors() :: list(String.t())
  def colors, do: @color_list

  @spec code(String.t()) :: integer()
  def code(color), do: @color_list |> Enum.find_index(fn x -> x==color end)

end
