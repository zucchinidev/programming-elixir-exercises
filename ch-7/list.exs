defmodule MyList do
  def len([]), do: 0
  def len([ _head | tail]), do: 1 + length(tail)

  def square([]), do: []
  def square([ head | tail ]), do: [ head * head | square(tail) ]

  def plus_one([]), do: []
  def plus_one([ head | tail ]), do: [ head + 1 | plus_one(tail) ]
end
