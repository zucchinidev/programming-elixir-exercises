# Write  a  function  that  takes  three  arguments.  If  the  first  two  are  zero,
# return “FizzBuzz.”
# If the first is zero, return “Fizz.”
# If the second is zero,
# return “Buzz.”
# Otherwise return the third argument.
# Do not use any lan-guage features that we haven’t yet covered in this book.

defmodule Funct do
  def fizz_buzz( 0, 0, _ ) do "FizzBuzz" end
  def fizz_buzz( 0, _, _ ) do "Fizz" end
  def fizz_buzz( _, 0, _ ) do "Buzz" end
  def fizz_buzz( _, _, third_argument ) do third_argument end
end

IO.puts Funct.fizz_buzz(0, 0, "yeahhh!!") # FizzBuzz
IO.puts Funct.fizz_buzz(0, 1, "yeahhh!!") # Fizz
IO.puts Funct.fizz_buzz(1, 0, "yeahhh!!") # Buzz
IO.puts Funct.fizz_buzz(1, 1, "yeahhh!!") # yeahhh!!
