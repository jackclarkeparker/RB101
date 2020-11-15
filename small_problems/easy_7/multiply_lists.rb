=begin

Aim:

Write a method that takes two Array arguments in which each Array contains a
list of numbers, and returns a new Array that contains the product of each pair
of numbers from the arguments that have the same index. You may assume that the
arguments contain the same number of elements.

  - input: Two Arrays
  - output: Array
  Rules
    - Input
      - Two Arrays of numbers
      - Same number of args
    - Output
      - populated by product of elements in args with same index


Examples:

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
happy path

Algorithm
  - Initialize result array
  - loop
    - assign product of elements in arr1/2 to result
  - return result
  -

=end

def multiply_list(array1, array2)
  result = []
  array1.size.times do |i|
    result[i] = array1[i] * array2[i]
  end
  result
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

=begin

# POST-SOLUTION

Again LS have used #each_with_index in a situation where we are iterating and
and referencing sequential elements in more than one array - referencing one
element with a block variable, and another with the index is a clean way of
displaying the output. Then again, in this situation, I kind of like showing
that the same index is being used in all of the arrays, because it really
clearly shows us that each element in the result array is the product of the
elements at the same index in the component arrays.

# FURTHER EXPLORATION
Use #zip to come up with a oneline solution.

=end

def multiply_list(array1, array2)
  array1.zip(array2).map { |subarr| subarr.reduce(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
