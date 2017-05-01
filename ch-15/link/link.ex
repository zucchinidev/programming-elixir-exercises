defmodule Link do
  import :timer, only: [ sleep: 1 ]

  def sad_function do
    sleep 500
    exit(:boom)
  end
  
  def run do
    spawn_link(Link, :sad_function, [])
    # Si el proceso hijo muere, el proceso padre tambíen --> spawn_link
    # Si el proceso hijo muere, el proceso padre no lo hace --> spawn
    receive do
      msg -> IO.puts "Message receive #{inspect(msg)}"
    after 1000 -> IO.puts "Nothing happened as far as I am concerned"
    end
  end
end