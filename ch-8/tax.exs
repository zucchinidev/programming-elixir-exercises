#Write a function that takes both lists and returns a copy of the orders,
#but with an extra field,
#total_amount, which is the net plus sales tax. If a
#shipment is not to NC or TX, there’s no tax applie

defmodule Tax do
  def calculate_tax(orders, tax_rates) do
    for order <- orders do
        total_amount = calculate(order[:net_amount], tax_rates[order[:ship_to]])
        order ++ [total_amount: total_amount]
    end
  end

  defp calculate(net_amount, nil), do: net_amount
  defp calculate(net_amount, tax_value) do
    net_amount * (1 + tax_value)
  end


  def run do
    orders = [
        [ id: 123, ship_to: :NC, net_amount: 100.00 ],
        [ id: 124, ship_to: :OK, net_amount:  35.50 ],
        [ id: 125, ship_to: :TX, net_amount:  24.00 ],
        [ id: 126, ship_to: :TX, net_amount:  44.80 ],
        [ id: 127, ship_to: :NC, net_amount:  25.00 ],
        [ id: 128, ship_to: :MA, net_amount:  10.00 ],
        [ id: 129, ship_to: :CA, net_amount: 102.00 ],
        [ id: 130, ship_to: :NC, net_amount:  50.00 ]
    ]

    tax_rates = [ NC: 0.075, TX: 0.08 ]

    IO.inspect calculate_tax(orders, tax_rates)
  end
end

