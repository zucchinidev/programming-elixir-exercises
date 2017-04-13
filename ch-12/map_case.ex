defmodule MapCase do
  def main do
    andrea = %{name: "Andrea", state: "Spain", likes: "Elixir"}
    case andrea do
      %{state: some_state} = person ->
        IO.puts "Person name: #{person.name}, state: #{person.state}"
      _ ->
        IO.puts "No matches"
    end
  end

  def main_with_guard_clauses do
    andrea = %{name: "Andrea", state: "Spain", likes: "Elixir", age: 26}
    case andrea do
      %{age: age} = person when age > 25 ->
        IO.puts "Person name: #{person.name}, state: #{person.state}"
      _ ->
        IO.puts "No matches"
    end
  end
end