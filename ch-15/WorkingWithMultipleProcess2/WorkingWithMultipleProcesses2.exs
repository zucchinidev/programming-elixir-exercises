defmodule WorkingWithMultipleProcesses2 do
  def run do
    fred = spawn(WorkingWithMultipleProcesses2, :fred, [])
    betty = spawn(WorkingWithMultipleProcesses2, :betty, [])
    send fred, { self, "FRED" }
    send betty, { self, "betty" }
    receive do
      { :ok, "betty", msg } -> IO.puts inspect(msg) <> " Betty first"
      { :ok, "fred", msg } -> IO.puts inspect(msg) <> " Fred first"
    end
    receive do
      { :ok, "betty", msg } -> IO.puts inspect(msg) <> " Betty second"
      { :ok, "fred", msg } -> IO.puts inspect(msg) <> " Fred second"
    end
  end
  
  def betty do
    receive do
      { sender, msg } -> send sender, { :ok, "betty", "Betty: Receive process send message to #{inspect(sender)} - #{String.upcase(msg)}"}
    end
  end
  
  def fred do
    receive do
      { sender, msg } -> send sender, { :ok, "fred", "Fred: Receive process send message to #{inspect(sender)} - #{String.downcase(msg)}"}
    end
  end
end