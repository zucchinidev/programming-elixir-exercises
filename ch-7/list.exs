defmodule MyList do
  def len([]), do: 0
  def len([ _head | tail]), do: 1 + length(tail)

  def square([]), do: []
  def square([ head | tail ]), do: [ head * head | square(tail) ]

  def plus_one([]), do: []
  def plus_one([ head | tail ]), do: [ head + 1 | plus_one(tail) ]

  def map([], _func), do: []
  def map([ head | tail ], func), do: [func.(head) | map(tail, func)]

  def sum(list), do: _sum(list, 0)

  def accumulator([]), do: 0
  def accumulator(list), do: Enum.reduce(list, fn value, accu -> value + accu end)

  def reduce([], value, _) do
    value
  end

  def reduce([head | tail], value, func) do
    reduce(tail, func.(value, head), func)
  end

  # Write  a  mapsum  function  that  takes  a  list  and  a  function.  It  applies  the
  # function to each element of the list and then sums the result, so
  # iex> MyList.mapsum [1, 2, 3], &(&1 * &1)
  # 14

  def mapsum(list, func) do
     Enum.map(list, func) |> Enum.reduce(&(&1 + &2))
  end

  defp _sum([], total), do: total
  defp _sum([ head | tail ], total), do: _sum(tail, total + head)
end
