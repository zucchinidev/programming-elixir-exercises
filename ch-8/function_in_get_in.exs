
actors = [ %{name: "Viggo"}, %{name: "Al Pacino"} ]


actor_with_letter_p = fn (:get, collection, next_fn) ->
    for row <- collection do
      if String.contains?(row.name, "P") do
        next_fn.(row)
      end
    end
end

IO.inspect get_in(actors, [actor_with_letter_p, :name])
#[nil, "Al Pacino"]