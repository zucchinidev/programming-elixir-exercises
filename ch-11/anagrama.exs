defmodule Anagrama do
  def is_anagrama(first_word, second_word) do
    try do
      ^first_word = String.reverse second_word
      true
    rescue
      e in MatchError -> false
    end
  end
end