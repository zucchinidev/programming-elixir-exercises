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
IO.puts "******************************************"

# The operator rem(a, b) returns the remainder after dividing a by b.
# Write a function that takes a single integer (n) and calls the function in
# the previ-ous exercise, passing it rem(n,3), rem(n,5), and n.
# Call it seven times with the arguments 10, 11, 12, and so on. You should get
# “Buzz, 11, Fizz, 13,14, FizzBuzz, 16.


defmodule FunctTwo do
  def call_function_fizz_buzz(number) do
    Funct.fizz_buzz(rem(number, 3), rem(number,5), number)
  end
end

range = 10..16
IO.inspect  Enum.map(range, &(FunctTwo.call_function_fizz_buzz(&1))) # ["Buzz", 11, "Fizz", 13, 14, "FizzBuzz", 16]
