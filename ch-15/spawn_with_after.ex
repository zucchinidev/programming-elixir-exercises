defmodule SpawnWithAfter do
  def greet do
    receive do
      { sender, msg } -> send sender, { :ok, "Hello #{msg}"}
    end
  end
end

defmodule SpawnClient do
  def send do
    pid = spawn(SpawnWithAfter, :greet, [])
    send pid, { self, "world!!"}
    receive do
      { :ok, msg } -> IO.puts msg
    end

    send pid, { self, " second message never processed"}
    # The second receive at the top level then just hangs, waiting
    # for a response that will never come
    receive do
      { :ok, msg } -> IO.puts msg
      after 500 -> IO.puts "The greeter has gone away"

    end
  end
end