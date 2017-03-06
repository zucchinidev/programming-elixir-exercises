defmodule DefaultParams do
  def fun(param1, param2 \\ 2, param3 \\ 3, param4) do
    IO.inspect [param1, param2, param3, param4]
  end
end

DefaultParams.fun("a", "b", "c", "d") # [a, b, c, d]
DefaultParams.fun("a", "b", "c")  # [a, b, 3, c]
DefaultParams.fun("a", "b") # [a, 2, 3, b]
# DefaultParams.fun("a") # [a, 2, 3, b] # no patter matching


defmodule Params do
  def func(param1, param2 \\ 123)
  def func(param1, param2) when is_list(param1) do
    "You said #{param2} with a list"
  end
  def func(param1, param2) do
    "You passed in #{param1} and #{param2}"
  end
end


IO.puts Params.func(99) # You passed in 99 and 123
IO.puts Params.func(99,"cat") # You passed in 99 and cat
IO.puts Params.func([99]) # You said 123 with a list
IO.puts Params.func([99],"dog") # You said dog with a list
