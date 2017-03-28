language = %{creator: "Valim", name: "Elixir"}
language_keywork_list = [creator: "Valim", name: "Elixir"]

language_elixir = Access.pop language, :name
creator = Access.pop language_keywork_list, :creator


elixir = language_elixir |> elem(0)
valim = creator |> elem(0)

IO.inspect valim <> " creador de " <> elixir
