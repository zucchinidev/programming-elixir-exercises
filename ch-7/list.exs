defmodule MyList do
  def len([]), do: 0
  def len([ _ | tail]), do: 1 + length(tail)
end
