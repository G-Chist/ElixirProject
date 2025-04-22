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
  def add_and_multiply_pipe(n, add_x, multiply_y) do
    # we need to have some initial value to go into the pipe
    n
    # passes the value of n as an argument, so it's add(n, add_x); |> + add_x won't work
    |> add(add_x)
    # passes the value of (n+add_x) as an argument, so it's multiply(add(n, add_x), multiply_y); |> * multiply_y won't work
    |> multiply(multiply_y)
  end

  # The function above is equivalent to this one
  def add_and_multiply(n, add_x, multiply_y) do
    (n + add_x) * multiply_y
  end

end

IO.puts ArithmeticFunctions.add_2(2)
IO.puts ArithmeticFunctions.add_and_multiply_pipe(1, 2, 3)
IO.puts ArithmeticFunctions.add_and_multiply(1, 2, 3)
