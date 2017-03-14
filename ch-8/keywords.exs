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