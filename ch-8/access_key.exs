cast = %{
       buttercup: %{
        actor: { "Robin", "Wright" },
        role: "princess"
        },

        westley: %{
            actor: {"Cary", "Elwes" },
            role: "farm boy"
        }
}

IO.inspect get_in cast, [
            Access.key!(:westley),
            :actor,
            Access.elem(1)
]

