add2 = fn (n) -> n + 2 end
IO.puts add2.(2)

defmodule ArithmeticFunctions do  # functions must be inside a module

  def add_2(n) do
    # return n*2  # this works, but is very rarely used. Elixir favors the last expression
    n + 2
  end

  def add(n, x), do: n + x
  def multiply(n, y), do: n * y

  # Using the pipe operator
  def add_and_multiply_pipe(n, x, y) do
    # we need to have some initial value to go into the pipe
    n
    # passes the value of n as an argument, so it's add(n, x); |> + x won't work
    |> add(x)
    # passes the value of (n+x) as an argument, so it's multiply(add(n, x), y); |> * y won't work
    |> multiply(y)
    # all of this can be rewritten as n |> add(x) |> multiply(y)
  end

  # The function above is equivalent to this one
  def add_and_multiply(n, x, y) do
    (n + x) * y
  end

end

IO.puts ArithmeticFunctions.add_2(2)
IO.puts ArithmeticFunctions.add_and_multiply_pipe(1, 2, 3)
IO.puts ArithmeticFunctions.add_and_multiply(1, 2, 3)
