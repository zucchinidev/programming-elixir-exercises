defmodule SpawnMessage do
  def greet do
    receive do
      {sender, msg} ->
        send(sender, {:ok, "Hello #{msg}"})
    end
  end
end

defmodule SpawnMessageClient do
  def send_message do
    pid = spawn(SpawnMessage, :greet, [])
    send(pid, {self(), "world"})
    receive do
      {:ok, msg} -> IO.puts msg
      _ -> IO.puts "An error ocurred"
    end
  end
end