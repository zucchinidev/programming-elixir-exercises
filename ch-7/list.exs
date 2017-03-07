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

  # Write a max(list) that returns the element with the maximum value in the
  # list. (This is slightly trickier than it sounds

  def max(list) do
    Enum.reduce(list, 0, fn acc, value -> _max(acc, value) end)
  end

  # En criptografía, el cifrado César, también conocido como cifrado por desplazamiento,
  # código de César o desplazamiento de César, es una de las técnicas de cifrado
  # más simples y más usadas. Es un tipo de cifrado por sustitución en el que
  # una letra en el texto original es reemplazada por otra letra que se
  # encuentra un número fijo de posiciones más adelante en el alfabeto.
  # Por ejemplo, con un desplazamiento de 3, la A sería sustituida por la D
  # (situada 3 lugares a la derecha de la A), la B sería reemplazada por la E, etc.
  # Este método debe su nombre a Julio César, que lo usaba para comunicarse con
  # sus generales.
  def caesar([], _), do: []
  def caesar([ head | tail ], n) do
    [ cypher(head, n) | caesar(tail, n) ]
  end

  # MyList.swap [1, 2, 3, 4] --> [2, 1, 4, 3]
  def swap([]), do: []
  def swap([a, b | tail]), do: [ b, a | swap(tail) ]
  def swap([_]), do: raise "Can't swap a list with and odd number of elements"

  defp cypher(chr, n) do
    97 + rem(chr + n - 97, 26)
  end

  defp _max(acc, value) when acc <= value, do: value
  defp _max(acc, value) when acc > value, do: acc

  defp _sum([], total), do: total
  defp _sum([ head | tail ], total), do: _sum(tail, total + head)
end
