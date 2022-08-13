defmodule Triangle do
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0 do
    { :error, "all side lengths must be positive" }
  end

  def kind(a, b, c) when a + b <= c or a + c <= b or b + c <= a do
    { :error, "side lengths violate triangle inequality" }
  end

  def kind(a,b,c) do
    case length(Enum.uniq([a,b,c])) do
      1 -> { :ok, :equilateral }
      2 -> { :ok, :isosceles }
      3 -> { :ok, :scalene }
    end
  end
end
