cast = [
    %{
        character: "Buttercup",
        actor: %{
            first: "Robin",
            last: "Wright"
        },
        role: "princess"
    },
    %{
        character: "Westley",
        actor: %{
            first: "Cary",
            last: "Elwes"
        },
        role: "farm boy"
    }
]

IO.inspect get_in cast, [Access.all(), :character]
# ["Buttercup", "Westley"]

IO.inspect get_and_update_in(cast, [
                            Access.at(1),
                            :actor,
                            :first
                        ],
                        fn (val) -> {val, String.upcase(val)} end)


# %{actor: %{first: "CARY", last: "Elwes".....