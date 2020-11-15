=begin

Aim:

Write a method that takes an Array of integers as input, multiplies all the
numbers together, divides the result by the number of entries in the Array, and
then prints the result rounded to 3 decimal places. Assume the array is
non-empty.

  - input: Array
  - output: String
  Rules
    -Input
      - Array of Integer
      - non-empty
    - Output
      - String
        - Contains float string
          - multiplicative average
            - found by multiplying all numbers and dividing by size of Array
            - Round to 3dp
    -
    -

format for 3dp floats with < 3 significant decimal figures.
reduce for multiplication.

Examples:

show_multiplicative_average([3, 5])                # => The result is 7.500
Where result has less than 3 decimal places, show with 3 dp.

show_multiplicative_average([6])                   # => The result is 6.000
Happy Path

show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667


Algorithm
  - find multiplicative average
  - print multiplicative average
  -
  -
  -

=end

def show_multiplicative_average(array)
  multiplicative_average = array.reduce(:*).fdiv(array.size)
  puts format("The result is %.3f", multiplicative_average)
end 

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
