# How to Choose Between Maps and Keyword Lists
# Ask yourself these questions (in this order):
# • Do I want to pattern-match against the contents 
# (for example, matching a dictionary that has a key of :name somewhere in it)?
#     If so, use a map.
# • Will I want more than one entry with the same key?
#     If so, you’ll have to use the Keyword module.
# • Do I need to guarantee the elements are ordered?
#     If so, again, use the Keyword module.
# • And, if you’ve reached this point:
#     Use a map

defmodule Canvas do
    @defaults [fg: "black", bg: "white", font: "Merriweather"]

    def draw_text(text, options \\ []) do
        options = Keyword.merge(@defaults, options)
        styles = Enum.join(Keyword.get_values(options, :style), ", ")
        IO.puts "Drawing text: #{inspect(text)}"
        IO.puts "Foreground: #{options[:fg]}"
        IO.puts "Background: #{Keyword.get(options, :bg)}"
        IO.puts "Font: #{Keyword.get(options, :font)}"
        IO.puts "Pattern: #{Keyword.get(options, :pattern, "solid")}"
        IO.puts "Pattern: #{styles}"

    end
end

Canvas.draw_text("hello world", fg: "red", style: "italic", style: "bold")