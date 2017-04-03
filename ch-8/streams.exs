IO.puts File.open('/usr/shared/dict/word')
    |> IO.stream(:line)
    |> Enum.max_by(&String.lengt/1)