defmodule FizzBuzzPatternMaching do
  def upto(n), do: 1..n |> Enum.map(&fizz_buzz/1)

  defp fizz_buzz(n), do: _fizz_buzz(n, rem(n, 3), rem(n, 5))
  defp _fizz_buzz(_n, 0, 0), do: "FizzBuzz"
  defp _fizz_buzz(_n, 0, _rem), do: "Fizz"
  defp _fizz_buzz(_n, _rem, 0), do: "Buzz"
  defp _fizz_buzz(n, _, _), do: n
end