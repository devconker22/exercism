defmodule SchoolScoresByConker(s) do
  do_slice(s,[],0)
end

defp do_slice([h|t], acc, n) when rem(length(acc),2) == 0 do
  do_slice(t,acc ++ div([acc|>Enum.slice(n,2)|>Enum.sum],2),n++)
end

defp do_slice([h|t], acc, n) when rem(length(acc),2) == 1 do
  do_slice(t,acc ++ div([acc|>Enum.slice(n,2)|>Enum.sum],2),n)
end

defp do_slice([],acc,_) do
  acc
  Enum.concat()
end
