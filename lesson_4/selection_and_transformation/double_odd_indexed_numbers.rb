def double_odd_indices(numbers)
  result = []
  counter = 0

  loop do
    break if counter == numbers.size
    
    result[counter] = numbers[counter]

    if counter.odd?
      result[counter] *= 2
    end

    counter += 1
  end

  result
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_indices(my_numbers)

=begin

# First Thoughts
- They used another variable, current_number, assigning numbers[counter] to
  this. They then work further with it, multiplying by two when the index is
  odd, and passing it into the result variable.
- It's worth taking a moment to write down thoughts that are concerning you
  when you've got them in the lead up to checking the LS solution. Pretty often
  the thoughts bouncing around in your head have some clever resolution in what
  LS does. Try to resolve them yourself before checking the solution.
  - To start with, just write down the thoughts.

=end