add2 = fn (n) -> n + 2 end
IO.puts add2.(2)

defmodule ArithmeticFunctions do  # functions must be inside a module
  def add_2(n) do
    # return n*2  # this works, but is very rarely used. Elixir favors the last expression
    n + 2
  end
end
IO.puts ArithmeticFunctions.add_2(2)
