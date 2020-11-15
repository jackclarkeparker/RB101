=begin

Aim:
Write a method that takes two Arrays as arguments, and returns an Array that
contains all of the values from the argument Arrays. There should be no
duplication of values in the returned Array, even if there are duplicates in
the original Arrays.

  - input: Two Arrays
  - output: Array
  Rules
    - Input Arrays
      - Two of them
    - Output Array
      - Contains all values from input arrays.
      - No duplication of elements
    -
    -
Example:

merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

Algorithm
  - Join the two input arrays together
  - Remove duplicate elements
  -
  -
  -

=end

def merge(arr1, arr2)
  arr1.concat(arr2).uniq!
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# Post-Solution
# They use Array#| which neatly fits the requirements of the problem.
# I also saw someone elses solution, and I don't need to destructively remove
# duplicates. Array#uniq was fine.