use Bitwise

defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @handshake_codes %{1=>["wink"], 2 =>["double blink"],4 =>["close your eyes"], 8=>["jump"]}

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    switch_conds(code,[])
  end

  defp switch_conds(code,list) when code < 1 do
    list
  end

  defp switch_conds(code,list) do
    IO.puts("current code is: #{code} list: #{list}")
    cond do
      (code &&& 1) == 1 -> switch_conds(code-1, list ++ @handshake_codes[1])
      (code &&& 2) == 2 -> switch_conds(code-2, list ++ @handshake_codes[2])
      (code &&& 4) == 4 -> switch_conds(code-4, list ++ @handshake_codes[4])
      (code &&& 8) == 8 -> switch_conds(code-8, list ++ @handshake_codes[8])
      (rem(code,16)) == 0 -> switch_conds(code-16, list |> Enum.reverse())
      true ->
    end
  end

end
