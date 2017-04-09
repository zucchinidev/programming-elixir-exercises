defmodule CenterString do
  def center(list_of_strings) do
    max_length = calculate_max_length list_of_strings
    list_of_strings |> insert_white_space(max_length)
  end

  defp calculate_max_length([]), do: 0
  defp calculate_max_length(list_of_strings) do
    list_of_strings
      |> Enum.max_by(&String.length/1)
      |> String.length
  end

  defp insert_white_space(list_of_string, max_length) do
    list_of_string
      |> Enum.each(&transform_string(&1, max_length))
  end

  defp transform_string(string, max_length) do
    string |> get_difference(max_length)
           |> get_num_spaces
           |> get_new_length(string)
           |> padding(string)
           |> show
  end
  
  defp get_difference(string, max_length) do
    max_length - String.length(string)
  end

  defp get_num_spaces(difference) do
    div(difference, 2)
  end

  defp get_new_length(num_spaces, string) do
    String.length(string) + num_spaces
  end

  defp padding(new_length, string) do
    String.pad_leading(string, new_length)
  end

  defp show(value) do
    IO.puts value
  end
end