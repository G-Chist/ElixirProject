add2 = fn (n) -> n + 2 end  # this is an anonymous function
# Use fn ... -> ... end to define
# Use the dot notation .() to call it
# IO.puts add2.(2)

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

# IO.puts ArithmeticFunctions.add_2(2)
# IO.puts ArithmeticFunctions.add_and_multiply_pipe(1, 2, 3)
# IO.puts ArithmeticFunctions.add_and_multiply(1, 2, 3)

# Some other anonymous functions
fall_velocity = fn (distance) -> :math.sqrt(2*9.8*distance) end
# & is the capture operator in Elixir. We can rewrite fall_velocity as follows:
# fall_velocity = &(:math.sqrt(2 * 9.8 * &1))
mps_to_kmh = fn (mps) -> mps * 3.6 end

# IO.puts fall_velocity.(200)
# IO.puts mps_to_kmh.(fall_velocity.(200))

# Now let's do this in a module:
defmodule Drop do
  @moduledoc """
  Functions calculating velocities achieved by objects dropped in a vacuum
  """
  @vsn 0.1  # Specify version
  @doc """
  Calculates the velocity of an object falling on a planet with a given gravity (9.8 by default)
  """
  import :math, only: [sqrt: 1]  # Import from the :math module, but ONLY function sqrt with an arity (# of arguments) of 1
  @spec fall_velocity(number()) :: float()  # Specify that the input is any number, the output is a float
  def fall_velocity(distance, gravity \\ 9.8) do  # \\ allows us to set an argument's default value
    sqrt(2*gravity*distance)
  end
end

# IO.puts Drop.fall_velocity(200)
# IO.puts Drop.fall_velocity(200, 9)  # Slightly lower gravity

fun=&Drop.fall_velocity/1  # get function from the module and turn it into a free-floating function (specify arity!)

IO.puts(fun.(20))
