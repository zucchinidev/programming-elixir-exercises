defmodule Attendee do
    defstruct name: "", over_18: true, paid: false

    def may_attend_after_party(attendee = %Attendee{}) do
        attendee.over_18 && attendee.paid
    end

    def print_vip_badge(%Attendee{name: name}) when name != "" do
        IO.puts "Very cheap badge for #{name}"
    end
    
    def print_vip_badge(%Attendee{}) do
        raise "missing name for barge"
    end
end
# a1 = %Attendee{name: "Andrea", paid: true, over_18: true}
# Attendee.print_vip_badge a1
# Very cheap badge for Andrea
# :ok


# Attendee.print_vip_badge %Attendee{name: ""}
# ** (RuntimeError) missing name for barge
# attendee.exs:13: Attendee.print_vip_badge/1