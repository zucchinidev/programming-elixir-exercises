defmodule Hotel do
    def book(%{ name: name, height: height }) when height > 1.9 do
        IO.puts "Need extra long bed for #{name}"
    end

    def book(%{ name: name, height: height }) when height < 1.3 do
        IO.puts "Need low shower controls for #{name}"
    end
    def book(person) do
        IO.puts "Need regular bed for #{person.name}"
    end
end


people = [
    %{name: "Pepe", height: 1.22},
    %{name: "Luis", height: 1.55},
    %{name: "Juan", height: 1.66},
    %{name: "Ana", height: 1.77},
    %{name: "María", height: 2.22},
    %{name: "Evelia", height: 1.32},
    %{name: "Iratxe", height: 1.74},
    %{name: "Carlos", height: 1.66},
    %{name: "Rober", height: 1.44}
]

people |> Enum.each(&Hotel.book/1)
