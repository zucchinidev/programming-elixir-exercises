defmodule PositiveNumber do
  @moduledoc false
  def get_positive(list), do: positive([], list)

  def positive(acc, []), do: acc
  def positive(acc, [head | tail]) do
    case head > 0 do
      true -> acc |> Enum.into([head]) |> positive(tail)
      false -> acc |> positive(tail)
    end
  end
end
