defmodule SpawnMultipleMessage do
  def greet do
    receive do
      { sender, msg } -> send sender, { :ok, "Hello world! #{msg}" }
      greet
    end
  end
end

defmodule SpawnClient do
  def send do
    pid = spawn(SpawnMultipleMessage, :greet, [])

    send pid, { self, " spawn, the first time"}
    receive do
      { :ok, msg } -> IO.puts(msg)
    end

    send pid, { self, " spawn handle multiple message, the second time"}
    receive do
      { :ok, msg } -> IO.puts(msg)
      after 500 -> IO.puts("The greeter has gone away")
    end
  end
end