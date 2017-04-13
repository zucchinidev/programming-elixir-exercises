defmodule Fizz_buzz_with_case do
  def upto(n), do: 1..n |> Enum.map(&_upto/1)

  defp _upto(n) do
    case { n, rem(n, 3), rem(n, 5) } do
      { _n, 0, 0 } -> "FizzBuzz"
      { _n, 0, _ } -> "Fizz"
      { _n, _, 0 } -> "Buzz"
      { n, _ , _ } -> n
    end
  end
end