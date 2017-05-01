defmodule ChainProcess do
  def counter(next_process) do
    receive do
      n -> send next_process, n + 1
    end
  end

  def create_process(n) do
    last = Enum.reduce(1..n, self,
      fn (_, next_process) ->
          spawn(ChainProcess, :counter, [next_process])
      end)

    send last, 0
    receive do
      final_answer when is_integer(final_answer) -> "Result is #{inspect(final_answer)}"
    end
  end

  def run(n) do
    IO.puts inspect :timer.tc(ChainProcess, :create_process, [n])
  end
end

# elixir -r chain_process.exs -e "ChainProcess.run(10)" {2553, "Result is 10"}
# elixir -r chain_process.exs -e "ChainProcess.run(100)" {2830, "Result is 100"}
# elixir -r chain_process.exs -e "ChainProcess.run(1_000)" {5829, "Result is 1000"}
# elixir -r chain_process.exs -e "ChainProcess.run(10_000)" {35399, "Result is 10000"}
# elixir -r chain_process.exs -e "ChainProcess.run(100_000)" {308872, "Result is 100000"}
# elixir -r chain_process.exs -e "ChainProcess.run(1000000)" Too many processes ** (SystemLimitError) a system limit has been reached
# It looks like the virtual machine won’t support 1.000.000 processes. Fortunately,
# this is not a hard limit we just bumped into a default value. We can increase
# this using the VM’s +P parameter. We pass this parameter to the VM using the --erl
# parameter to elixir

# elixir --erl "+P 1000000"  -r chain_process.exs -e "ChainProcess.run(1000000)" {3004119, "Result is 1000000"}


