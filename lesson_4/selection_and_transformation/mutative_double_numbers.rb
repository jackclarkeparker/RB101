def mutative_double_numbers(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter]= numbers[counter] * 2

    counter += 1
  end

  numbers
end

p my_numbers = [1, 4, 3, 7, 2, 6]
mutative_double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]
p my_numbers

=begin

# First Thoughts
- Line # 7 can be condensed to numbers[counter] *= 2
