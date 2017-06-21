defmodule Streams do
  def lazy_transformation do
    ["Alice", "Bob", "Frank"]
      |> Stream.with_index
      |> Enum.each(fn ({value, index}) -> IO.puts "#{index + 1}. #{value}" end)
  end

  def square_non_negative_numbers do
    [9, -1, "foo", 25, 49]
      |> Stream.filter(&(is_number(&1) and &1 > 0))
      |> Stream.map(&{&1, :math.sqrt(&1)})
      |> Stream.with_index
      |> Enum.each(fn ({{input, result}, index}) -> IO.puts "#{index + 1}. sqrt(#{input}) = #{result}" end)
      
#      1. sqrt(9) = 3.0
#      2. sqrt(25) = 5.0
#      3. sqrt(49) = 7.0
  end
end