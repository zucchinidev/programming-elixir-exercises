defmodule Spawn1 do
  def greet do
    receive do
      {sender, msg} ->
        send sender, { :ok, "Hello, #{msg}" }
    end
  end
end

defmodule SpawnClient do
  # here's a client
  def send do
      pid = spawn(Spawn1, :greet, [])
      send pid, {self, "World!"}

      receive do
        {:ok, message} ->
          IO.puts message <> " between processes" # Hello, World! between processes
      end
  end

end