# We could event write it as
defmodule TimesShort, do: (def double(number), do: number * 2)
# but don't please

defmodule Times do
  def double(number), do: number * 2
  def triple(number), do: number * 3
  def quadruple(number), do: double(number) * 2
end
