defmodule Guard do
  def what_is(x) when is_number(x) do
    IO.puts "Is a number #{x}"
  end
  def what_is(x) when is_list(x) do
    IO.puts "Is a list #{inspect(x)}"
  end
  def what_is(x) when is_atom(x) do
    IO.puts "Is a atom #{x}"
  end
end

Guard.what_is(1)
Guard.what_is([1, 2, 3, 4])
Guard.what_is(:all)


defmodule Factorial do
  def of(0), do: 1
  def of(n) when n > 0 do
    n *   of(n - 1)
  end
end
