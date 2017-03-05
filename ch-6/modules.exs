# We could event write it as
defmodule TimesShort, do: (def double(number), do: number * 2)
# but don't please

defmodule Times do
  def double(number), do: number * 2
  def triple(number), do: number * 3
  def quadruple(number), do: double(number) * 2
end


defmodule Factorial do
  def of(0), do: 1
  def of(n), do: n * of(n - 1)
end


defmodule SumOfTheFirstXNumbers do
  def sum(0), do: 0
  def sum(n), do: n + sum(n - 1)
end

defmodule LengthOfList do
  def get_length([]), do: 0
  def get_length([head | tail]) do
    1 + length(tail)
  end
end

# Write a function gcd(x,y) that finds the greatest common divisor between
# two nonnegative integers. Algebraically, gcd(x,y) is x if y is zero; it’s
# gcd(y,rem(x,y)) otherwise.

defmodule Maths do
  def gcd(x, y) when y == 0, do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end
