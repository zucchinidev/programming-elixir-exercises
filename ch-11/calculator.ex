defmodule Calculator do
  def calculate(operation) do
    { operand1, operator, operand2} = extract_parts(operation)
    _calculate({ operand1, operator, operand2 })
  end

  defp _calculate({ope1, '+', ope2}), do: ope1 + ope2
  defp _calculate({ope1, '-', ope2}), do: ope1 - ope2
  defp _calculate({ope1, '*', ope2}), do: ope1 * ope2
  defp _calculate({ope1, '/', ope2}), do: ope1 / ope2

  defp extract_parts(operation) do
    operator? = &( &1 in '+-*/' )
    [ operand1, operator, operand2 ] = operation |> Enum.reject(&is_space?/1)
                                                 |> Enum.chunk_by(operator?)
    { chars_to_integer(operand1), operator, chars_to_integer(operand2) }
  end

  defp is_space?(character) do
    character == (?\s)
  end

  defp chars_to_integer(char) do
    {number, _ } = char |> to_string |> Integer.parse
    number
  end
end







