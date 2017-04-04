#A 65
#Z 90
#
#a 97
#z 122

defmodule Ascii do
  def is_ascii_character([]), do: false
  def is_ascii_character(character), do: _is_ascii_character(character, false)

  defp _is_ascii_character([], is_valid), do: is_valid
  defp _is_ascii_character(character, is_valid) when not is_list character do
    false
  end
  defp _is_ascii_character([ head | tail ], is_valid) do
    is_valid = _is_valid_number(head)
    if !is_valid do
    _is_ascii_character([], is_valid)
    end
    _is_ascii_character(tail, is_valid)
  end

  defp _is_valid_number(number) when number > 64 and number < 91, do: true
  defp _is_valid_number(number) when number > 96 and number < 123, do: true
  defp _is_valid_number(number), do: false
end