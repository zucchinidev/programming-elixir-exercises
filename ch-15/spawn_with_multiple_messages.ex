defmodule SpawnWithMultipleMessages do
  def greet do
    receive do
      {sender, msg} -> send(sender, {:ok, "Hello #{msg}"})
      greet
    end
  end

  def spawn do
    pid = spawn(SpawnWithMultipleMessages, :greet, [])
    send(pid, {self(), "world"})
    receive do
      {:ok, msg} -> IO.puts msg
    end

    send(pid, {self(), " eyyyy"})
    receive do
      {:ok, msg} -> IO.puts msg
    after 500 ->
      IO.puts "The greeter has gone away"
    end
  end
end