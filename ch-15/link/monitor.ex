defmodule Monitor do
  import :timer, only: [ sleep: 1 ]

  def sad_function do
    sleep 500
    exit(:boom)
  end
  
  def run do

    monitor = spawn_monitor(Monitor, :sad_function, [])
    IO.puts inspect monitor
    # {#PID<0.77.0>, #Reference<0.0.4.8>}


    receive do
      msg -> IO.puts "Message receive #{inspect(msg)}" # Message receive {:DOWN, #Reference<0.0.4.8>, :process, #PID<0.77.0>, :boom}
    after 1000 -> IO.puts "Nothing happened as far as I am concerned"
    end
  end
end
Monitor.run # {:DOWN, #Reference<0.0.4.8>, :process, #PID<0.77.0>, :boom}

#The Reference  record in the message is the identity of the monitor that was
#created. The spawn_monitor  call also returns it, along with the PID.)
#So, when do you use links and when should you choose monitors?
#It depends on your processes’ semantics. If the intent is that a failure in one
#process should terminate another, then you need links. If instead you need
#to know when some other process exits for any reason, choose monitors