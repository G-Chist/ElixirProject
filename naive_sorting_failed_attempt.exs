# Define a tuple with some elements
my_tuple = {100,2,31,4,51,6,72,8,9,10}

# Define helper variables to sort the tuple
buffer = -1

# Get the size of the tuple using `tuple_size/1`
tuple_len = tuple_size(my_tuple)

# Sort
for i <- 0..(tuple_len - 1) do
  for j <- i..(tuple_len - 1) do
    if elem(my_tuple, j) < elem(my_tuple, j+1) do

      # This does not work! Tuple elements are IMMUTABLE
      buffer = elem(my_tuple, j)
      elem(my_tuple, j) = elem(my_tuple, j+1)
      elem(my_tuple, j+1) = buffer

    end
  end
end

# Use a `for` loop over a range of indices from 0 to tuple_len - 1
for i <- 0..(tuple_len - 1) do
  # Access each element using `elem/2`, which takes the tuple and an index
  IO.puts("Element at index #{i}: #{elem(my_tuple, i)}")
end
