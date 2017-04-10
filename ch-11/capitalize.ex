defmodule Capitalize do
  def upcase(string) do
    string |> separate_sentences |> Enum.map(&capitalize(&1)) |> join_sentences
  end

  defp separate_sentences(string) do
    String.split(string, ". ")
  end

  defp capitalize(sentence) do
    String.capitalize sentence
  end

  defp join_sentences(sentences) do
    Enum.join(sentences, ". ")
  end
end