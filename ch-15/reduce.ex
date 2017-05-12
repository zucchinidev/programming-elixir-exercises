defmodule Reduce do
  def sum(list) do
   Enum.reduce(list, 0, &do_sum/2)
  end

  defp do_sum(value, acc) when is_number(value) or is_float(value) do
    acc + value
  end
  defp do_sum(_, acc), do: acc

  def map(list) do
   Enum.reduce(list, [], &get_names/2)
  end

  defp get_names(%{name: name}, acc) do
    [ %{name: name} | acc ]
  end
  
  def nested_map_inspection(nested_map, path) do
   path |> String.split(".") |> Enum.reduce(nested_map, &map_has_key/2)
  end

  defp map_has_key(key, nested_map) do
    try do
      case nested_map[key] do
        nil -> false
        x -> x
      end
    rescue
      FunctionClauseError -> false
    end
  end
end
# person = %{"name" => "andrea", "child" =>  %{ "name" => "Libertad"}}
# Reduce.nested_map_inspection(person, "name.person.odeoe")
# false
# Reduce.nested_map_inspection(person, "child.name")
# "Libertad"
# Reduce.nested_map_inspection(person, "child")
# %{"name" => "Libertad"}



# Reduce.map([%{name: "Andrea", last_name: "Zucchini"}, %{name: "Francisco", last_name: "Ávila"}])
# [%{name: "Francisco"}, %{name: "Andrea"}]