=begin

Aim:

Write a method that takes two Array arguments in which each Array contains a
list of numbers, and returns a new Array that contains the product of every
pair of numbers that can be formed between the elements of the two Arrays. The
results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

  - input: Two Arrays
  - output: New Array
  Rules
    - Input Two Arrays
      - Can have different lengths
      - Non empty
    - Output New Array
      - Contains the product all combinations of elements
      - sorted by increasing value
    -

Examples:

multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

Algorithm
  - find all combinations of an element from each array
  - reduce these combinations to their product
  - sort
  -
  -

=end

def multiply_all_pairs(arr1, arr2)
  combinations = arr1.product(arr2)
  combinations.map { |combo| combo.reduce(:*) }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
