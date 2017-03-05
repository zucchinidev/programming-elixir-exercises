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


# ==============================================================================
fun1 = fn -> fn -> "hello" end end
IO.puts fun1.().() # hello
hello = fun1.()
IO.puts hello.() # hello


# ==============================================================================
# Function remermber the original enviroment
# ==============================================================================
# Closures
greeting = fn(name) -> fn -> "Hello #{name}" end end
greetingTwo = &(fn -> "Hello #{&1}" end)
andrea_greeting = greeting.("Andrea")
IO.puts greeting.("Andrea").() # Hello Andrea
IO.puts greetingTwo.("Andrea").() # Hello Andrea
IO.puts andrea_greeting.() # Hello Andrea

# ==============================================================================
# With params
# ==============================================================================

sum = &(fn number -> &1 + number end)
sumTen = sum.(10)
IO.puts sumTen.(5) # 15


# ==============================================================================
# Prefix
# ==============================================================================

prefix = &(fn text -> &1 <> " " <> text end)
prefixMrs = prefix.("Mrs")
IO.puts prefixMrs.("Andrea") # Mrs Andrea
IO.puts prefix.("Elixir").("Rocks") # Elixir Rocks

# ==============================================================================
# Passing functions with as arguments
# ==============================================================================

times_2 = &(&1 * 2)
apply = fn(fun, value) -> fun.(value) end
IO.puts apply.(times_2, 10) # 20

# ==============================================================================
# Pinned values and functoin parameters
# ==============================================================================

defmodule Greeting do
  def for(name, greeting) do
    fn
      (^name) -> "#{greeting} #{name}"
      (_) -> "I don't know"
    end
  end
end

mr_andrea = Greeting.for("Andrea", "yeahhh!!")
IO.puts mr_andrea.("Andrea")  # yeahhh!! Andrea
IO.puts mr_andrea.("---") # I don't know



# ==============================================================================
# The & notation
# ==============================================================================

# Use the & notation to rewrite the following.
# Enum.map [1,2,3,4], fn x -> x + 2 end
# Enum.each [1,2,3,4], fn x -> IO.inspect x end

list = Enum.to_list(1..4)
Enum.map(list, &(IO.inspect &1 + 2))
IO.puts "*************************************"
Enum.map(list, &(IO.inspect &1))
