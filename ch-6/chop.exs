defmodule Chop do
  def guess(range) do
    is_correct_number = is_correct(random(range))
    is_correct_number.(ask_user())
  end

  defp is_correct(guess_number) do
    &(is_correct(guess_number, &1, count_responses(0)))
  end

  defp is_correct(guess_number, response_user, num_responses) when guess_number == response_user do
    IO.puts "Correct!!! The guess number is #{guess_number}"
    IO.puts "Attempts!!! #{num_responses}"
  end

  defp is_correct(guess_number, response_user, num_responses) when guess_number < response_user do
    show_message(guess_number, response_user)
    is_correct(guess_number, ask_user(), count_responses(num_responses))
  end

  defp is_correct(guess_number, response_user, num_responses) when guess_number > response_user do
    show_message(guess_number, response_user)
    is_correct(guess_number, ask_user(), count_responses(num_responses))
  end

  defp ask_user do
    response_user = String.strip(IO.gets "It is ")
    {response, _} = Integer.parse(response_user)
    response
  end

  defp random(range) do
    Enum.random(range)
  end

  defp show_message(guess_number, response_user) when guess_number < response_user do
    IO.puts "The guess number is lower"
  end

  defp show_message(guess_number, response_user) when guess_number > response_user do
    IO.puts "The guess number is bigger"
  end

  defp count_responses(n) do
    n + 1
  end
end
