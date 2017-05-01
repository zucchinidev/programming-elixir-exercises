defmodule Link do
  import :timer, only: [ sleep: 1 ]

  def sad_function do
    sleep 500
    exit(:boom)
  end
  
  def run do
    Process.flag(:trap_exit, true)
    spawn_link(Link, :sad_function, [])
    # Si el proceso hijo muere, el proceso padre tambíen --> spawn_link
    # Ahora el proceso padre no muere porque atrapamos el exit del hijo con Process.flag(:trap_exit, true)
    receive do
      msg -> IO.puts "Message receive #{inspect(msg)}" # Message receive {:EXIT, #PID<0.87.0>, :boom}
    after 1000 -> IO.puts "Nothing happened as far as I am concerned"
    end
  end
end