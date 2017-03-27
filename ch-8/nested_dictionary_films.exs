films = %{
    lord_of_rings: %{
        actor: %{
            firstName: "Viggo",
            last: "Mortensen"
        }
    },
    scarface: %{
        actor: %{
                firstName: "Alfredo James",
                last: "Pacino"
            }
        }
}

lord_of_ring_actor_name = get_in(films, [:lord_of_rings, :actor, :firstName])
IO.inspect lord_of_ring_actor_name


IO.inspect put_in(films, [:scarface, :actor, :firstName], "Al")

# "Viggo"
# %{lord_of_rings: %{actor: %{first: "Viggo", last: "Mortensen"}},
#   scarface: %{actor: %{first: "Al", last: "Pacino"}}}



