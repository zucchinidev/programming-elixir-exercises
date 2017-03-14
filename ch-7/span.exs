defmodule Span do
  def get_list(from, from), do: []
  def get_list(from, to) when from < to, do: [from | get_list(from + 1, to)]
  def get_list(from, to) when from > to, do: raise "Data not valid"
end
