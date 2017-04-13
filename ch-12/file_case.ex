defmodule FileCase do
  def main, do: open_file("fizz_buzz_pattern_matching.ex")
  defp open_file(path) do
    case File.open(path) do
      {:ok, file} -> IO.puts "First line #{IO.read(file, :line)}"
      {:error, reason} -> IO.puts "Failed to open file: #{reason}"
    end
  end
end