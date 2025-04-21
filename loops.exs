# Define a list of numbers. Lists in Elixir are denoted with square brackets.
numbers = [1, 2, 3, 4, 5]

# Use a `for` comprehension to iterate over each element in the list `numbers`.
# The syntax `n <- numbers` means: for each element `n` in the list `numbers`,
# evaluate the block of code that follows.
# The result of each iteration (here, `n * 2`) is collected into a new list.
doubled = for n <- numbers do
  n * 2  # Multiply the current number by 2. This becomes an element in the result list.
end

# Use IO.inspect to print the resulting list of doubled numbers to the console.
# This is similar to `print` in other languages.
IO.inspect(doubled)  # Expected Output: [2, 4, 6, 8, 10]

# --------------------------------------------------------------------

# Define a module named Looper. Modules in Elixir are containers for functions and other definitions.
defmodule Looper do
  # Define a recursive function called `print_list` that takes a list as its argument.

  # This is the base case of the recursion: when the list is empty (`[]`),
  # we simply return `:ok`, which is an atom used to indicate success or completion.
  def print_list([]) do
    :ok  # Base case: do nothing and end the recursion
  end

  # This is the recursive case: when the list is not empty, we match on `[head | tail]`,
  # which is Elixir's way of deconstructing a list into its first element (`head`)
  # and the rest of the list (`tail`).
  def print_list([head | tail]) do
    # Print the current element of the list. `IO.puts` outputs a string to the console.
    IO.puts("Current number: #{head}")

    # Recursively call `print_list` on the remaining elements (`tail`)
    # until the base case (empty list) is reached.
    print_list(tail)
  end
end

# Call the recursive function on a sample list of numbers.
Looper.print_list([10, 20, 30])

# Expected Output:
# Current number: 10
# Current number: 20
# Current number: 30


# --------------------------------------------------------------------

# Define a list of strings, each representing a fruit.
fruits = ["apple", "banana", "cherry"]

# Use `Enum.each/2` to iterate over each item in the `fruits` list.
# `Enum.each` takes two arguments:
#   1. The list to iterate over
#   2. An anonymous function (`fn fruit -> ... end`) that is executed for each element.
Enum.each(fruits, fn fruit ->
  # Inside the anonymous function:
  # `fruit` is bound to the current item in the list.
  # We use `IO.puts` to print a string that includes the current fruit.
  IO.puts("Fruit: #{fruit}")
end)

# Expected Output:
# Fruit: apple
# Fruit: banana
# Fruit: cherry

# --------------------------------------------------------------------
