defmodule Customer do
    defstruct [name: "", company: ""]
  end

defmodule BugReport do
    defstruct [owner: %Customer{}, details: "", severity: 1]
end

# report = %BugReport{owner: %Customer{name: "Andrea"}, details: "Elixir plugin don't work", severity: 5}

# report = %{report | owner: %{report.owner | company: "Company of heroes"} }
# %BugReport{details: "Elixir plugin don't work", owner: %Customer{company: "Company of heroes", name: "Andrea"}, severity: 5}


# put_in(report.owner.company, "AdManMedia")
# %BugReport{details: "Elixir plugin don't work",
# owner: %Customer{company: "AdManMedia", name: "Andrea"}, severity: 5}


# update_in report.owner.name, &("Mr " <> &1)
# %BugReport{details: "Elixir plugin don't work",
# owner: %Customer{company: "Company of heroes", name: "Mr Andrea"}, severity: 5}

