defmodule Dictionary do
  def hello do
    IO.puts "Hello world!!"
  end
  def word_list do
    contents = File.read!("assets/words.txt")
    list     = String.split(contents, ~r/\n/)  # Split by new line
  end
end
