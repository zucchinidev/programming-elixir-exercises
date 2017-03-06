handle_open = fn
    { :ok, file } -> IO.puts "Show data: #{IO.read(file, :all)}"
    { _, error } -> IO.puts "Error, file not found: #{:file.format_error(error)}"
end

IO.puts handle_open.(File.open("hello.exs"));
IO.puts handle_open.(File.open("not-found.exs"));
