defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(map, String.t(), integer) :: map
  def add(db, name, grade) do
    Map.update(db,grade, [name], fn x -> [name|x] end)
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(map, integer) :: [String.t()]
  def grade(db, grade) do
    case Map.fetch(db,grade) do
      :error -> []
      {:ok,x} -> x
    end

  end

  def sort(db), do: db |> Enum.map(fn {k, _v} -> {k, Enum.sort(grade(db, k))} end)

end
