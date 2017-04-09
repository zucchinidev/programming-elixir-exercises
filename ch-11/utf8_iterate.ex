defmodule Utf8Iterate do
  def each(str, func) when is_binary(str), do: _each(str, func)
  
  defp _each(<<>>, _), do: [] # empty binary
  defp _each(<< head :: utf8, tail :: binary >>, func) do
    func.(head)
    _each(tail, func)
  end
end

Utf8Iterate.each "hello world", fn char -> IO.puts char end
# Result
#104
#101
#108
#108
#111
#32
#119
#111
#114
#108
#100