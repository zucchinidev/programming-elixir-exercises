defmodule Person do
    def query(limitHeight) do
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

        IO.inspect(for person = %{ height: height } <- people, height > limitHeight, do: person)
    end
end

Person.query(1.50)
# [%{height: 1.55, name: "Luis"}, %{height: 1.66, name: "Juan"},
#  %{height: 1.77, name: "Ana"}, %{height: 2.22, name: "María"},
#  %{height: 1.74, name: "Iratxe"}, %{height: 1.66, name: "Carlos"}]
