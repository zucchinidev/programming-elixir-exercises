data = %{ name: "Dave" , state: "TX", likes: "Elixir" }
for key <- [ :name, :likes ] do
    %{ ^key => value } = data
    IO.puts value
end
# Dave
# Elixir
