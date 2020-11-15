=begin

Aim:

Write a method that takes an Array of numbers and then returns the sum of the
sums of each leading subsequence for that Array. You may assume that the Array
always contains at least one number.

Questions:
  - What is a leading subsequence?
  - Numbers ~ Integers or Floats?
    * Won't make any difference
  - Negatives?
    * Won't make any difference
  -

  - input: Array
  - output: Integer
  Rules
    Explicit Requirements:
    - Input Array
      - Contains at least one number
    - Output Integer
      - Sum of sums of each leading subsequence from input Array.
        - Leading refers to the characters at the start of a string, or the
          elements at the start of an array.
    -
    Implicit Requirements:
    - Subsequence sum is
      - sum of incrementing subsequences
      - all subsequences starting with leading element
        - for [3, 5, 2] ~ (3), (3, 5), (3, 5, 2)
    -
    -

Examples:

sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
Happy Path

sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
Happy Path

sum_of_sums([4]) == 4
Single element array will return value of element

sum_of_sums([1, 2, 3, 4, 5]) == 35
Happy Path

Algorithm
  - Initialize subsequence_sums empty array
  - Set subsequence_length variable to 1
  - While subsequence_length is less than or equal to the length of input array
    - find the sum of a the subsequence of in input array starting at index 0
      of subsequence_length.
    - push subsequence_sum into subsequence_sums array
    - increment subsequence_length
  - Find the sum of values in the subsequence_sums array.
=end

def sum_of_sums(array)
  subsequence_sums = []
  subsequence_length = 1
  while subsequence_length <= array.length
    subsequence_sums << array.slice(0, subsequence_length).sum
    subsequence_length += 1
  end
  subsequence_sums.sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
