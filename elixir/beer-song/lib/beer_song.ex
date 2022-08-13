defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(0), do: "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
  def verse(1), do: "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
  def verse(2), do: "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
  def verse(n) when n in 3..99, do: "#{n} bottles of beer on the wall, #{n} bottles of beer.\nTake one down and pass it around, #{n-1} bottles of beer on the wall.\n"

  @spec lyrics(Range.t()) :: String.t()
  def lyrics(), do: Enum.map_join(99..0, "\n", &verse/1)
  def lyrics(range), do: Enum.map_join(range, "\n", &verse/1)

end
