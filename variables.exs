gravity = 9.8  # Dynamic typing
example_string = "This is a string!"
example_bool = true
example_atom = :true  # An atom's value is its own name (:true is also an atom)
list_example = [1,2,3,4,5]  # Stored in memory as a linked list
tuple_example = {1, 2, 3, 4, 5}  # Stored in memory as an array
IO.puts gravity
IO.puts example_string
IO.puts example_bool == example_atom
IO.puts List.first list_example  # Standard list method
IO.puts List.last list_example  # Standard list method
IO.puts elem(tuple_example, 0)  # Indices start with 0

# When counting the elements in a data structure, Elixir also abides by a simple rule:
#   the function is named size if the operation is in constant time
#     (i.e. the value is pre-calculated)
#   or length if the operation is linear
#     (i.e. calculating the length gets slower as the input grows).
# As a mnemonic, both “length” and “linear” start with “l”.
