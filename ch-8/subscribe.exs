defmodule Subscribe do
    defstruct name: "", paid: false, over_18: true
end
# subscribe_one = %Subscribe{name: "Andrea", paid: true} 
# subscribe_two = %Subscribe{ subscribe_one | name: "Marie" }
# %Subscribe{name: "Marie", over_18: true, paid: true}
