defmodule EnumFake do
  def all?([], _fun), do: true
  def all?([ head | tail ], fun) do
    if fun.(head) do
      all?(tail, fun)
    else
      false
    end
  end


  def each([], _fun), do: :ok
  def each([ head | tail ], fun) do
    fun.(head)
    :ok
    each(tail, fun)
  end
  
  def filter([], _fun), do: []
  def filter([ head | tail ], fun) do
    if fun.(head) do
      [ head | filter(tail, fun) ]
    else
        filter(tail, fun)
    end
  end

  def split([], _), do: []
  def split(collection, value) do
    aux_collection = Enum.take collection, value
    { aux_collection, collection -- aux_collection }
  end


  def take([], _), do: []
  def take([ head | tail], number) do
    if number > 0 do
      [ head | take(tail, number - 1) ]
    else
      []
    end
  end

  def flatten([]), do: []
  def flatten([ head | tail ]) do
    flatten(head) ++ flatten(tail)
  end
end