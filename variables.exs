gravity = 9.8  # Dynamic typing
example_string = "This is a string!"
example_bool = true
example_atom = :true  # An atom's value is its own name (:true is also an atom)
list_example = [1,2,3,4,5]  # Stored in memory as a linked list
IO.puts gravity
IO.puts example_string
IO.puts example_bool == example_atom
IO.puts List.first list_example
IO.puts List.last list_example
