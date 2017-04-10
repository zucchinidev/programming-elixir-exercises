defmodule Tax do
  @moduledoc """
  Write a function that reads and parses this file and then passes the result
  to the sales_tax function. Remember that the data should be formatted into
  a keyword list, and that the fields need to be the correct types (so the id
  field is an integer, and so on)
  """

  def calculate_tax do
    open_file("tax.txt")
  end

  defp open_file(file_path) do
    File.stream!(file_path)
      |> Enum.map(&format_data(&1)) |> sales_tax
  end

  defp format_data(line) do
     String.replace(line, "\n", "")
        |> String.replace(":", "")
        |> String.split(",")
        |> create_keywordlist
  end

  defp create_keywordlist([ id, ship_to, net_amount ]) do
    [ id: id, ship_to: String.to_atom(ship_to), net_amount: String.to_float(net_amount) ]
  end

  defp sales_tax(orders) do
    for order <- orders do
      total_amount = calculate_total_amount order
      order ++ [total_amount: total_amount]
    end
  end

  defp calculate_total_amount(order) do
    tax_rates = get_tax_rates
    case tax_rates[order[:ship_to]] do
      nil -> order[:net_amount]
      x -> order[:net_amount] * (1 + x)
    end
  end

  defp get_tax_rates do
    tax_rates = [ NC: 0.075, TX: 0.08 ]
  end
end