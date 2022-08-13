defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count < 1, do: raise "n should be 1 or greater"
  def nth(count), do: do_nth(count, 2, [])

  defp do_nth(0, value, _), do: value
  defp do_nth(count, value, primes) do
    if prime?(value, primes) do
      do_nth(count - 1, value, [value | primes])
    else
      do_nth(count, value + 1, primes)
    end
  end

  defp prime?(value, lesser_primes) do
    Enum.all?(lesser_primes, fn prime -> rem(value, prime) != 0 end)
  end
end
