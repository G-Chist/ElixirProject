defmodule Dictionary do  # All modules declared like defmodule <Name> end
  def hello do  # Functions declared like def <Name> do end
    IO.puts "Hello world!!"
  end
  def word_list do
    contents = File.read!("assets/words.txt")
    words    = String.split(contents, ~r/\n/)  # Split by new line, ~r for regex

    firstWord = List.first words
    lastWord  = List.last words

    IO.puts firstWord
    IO.puts lastWord
  end
end
