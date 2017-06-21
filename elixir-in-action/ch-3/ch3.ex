defmodule Ch3 do
  def comprehensions do
    for x <- 1..3 do
      x * x
    end
  end
  
  def multiplication_table(number) do
    result = for x <- 1..10  do
      {x, number, x * number}
    end
    result |> Enum.each(fn {x, y, val} -> IO.puts "#{x} x #{y} = #{val}"  end )
  end

  def multiplication_tables_up_to_number(number) do
    result = for x <- 1..number, y <- 1..10 do
      {x, y, x * y}
    end
    result |> Enum.each(fn {x, y, val} ->
      IO.puts "#{x} x #{y} = #{val}"
      cond do
        y == 10 -> IO.puts "**********************"
        true ->
      end
    end )
  end
end