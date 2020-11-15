=begin

Aim:

Write a method that takes an integer argument, and returns an Array of all
integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater
than 0.



Questions:
  - Which way does the sequence go, up or down?
  - Is the sequence consecutive?
  -
  -
  -

Questions that have come up later:
  -
  -

Rules
### EXPLICIT:
    - Input: Integer
    * Always greater than 0.
    - Output: Returned array of integers
    * ascending sequence of consecutive integers from 1..input
    -
    -
    -

### IMPLICIT:
    - Sequence
    * Consecutive numbers in ascending order, e.g.
    input arg: 5 --> [1, 2, 3, 4, 5]
    -
    -

Examples:

sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]
Boundary condition: Lowest possible input, returns array of self

Data Structure:
  - Sequence array will have input number of elements
    - Sequence is a range of 1..input
  - Integer going to an array.
  -

Algorithm
  - Find the range of numbers in the sequence
  - Return these as an array
  -
  -
  -

=end

# def sequence(input_number)
#   (1..input_number).to_a
# end

# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]

=begin

# POST-SOLUTION

___First thoughts___
  - Same as solution
  -
  -
  -

___Mental Model Modifications___
  -
  -

# FURTHER EXPLORATION

Aim:

Food for thought: what do you think sequence should return if the argument is
not greater than 0. For instance, what should you do if the argument is -1?
Can you alter your method to handle this case?

input: -1 --> array: [1, 0, -1]

possibly negative input should result in array that starts at negative 1, not
positive. But then, how do you do 0?

Questions:
  -
  -
  -
  -

  Rules
    - Input: Integer
    * Can be any positive or non-positive integer
    - Output: Array
    # Contains sequence of numbers from 1 to input, consecutive
    - Input can be 0 or negative now
    -
    -

Examples:

input: 3 --> array: [1, 2, 3]
input: -3 --> array: [1, 0, -1, -2, -3]
input: 0 --> array: [1, 0]

Data Structure:
  - Positive input results in array with <input> number of elements
  - Negative input results in array with <input>.abs + 2 number of elements
  - Input of zero results in array of 2 elements
    - Sequence is a range of 1..input
  - Integer going to an array.
  -

Algorithm
  - Form sequence of numbers from 1 to input
    - Identify range that is 1..input
      - Negative range won't be returnable as array.
  - convert to array and return
  -
  -
  -
  -

=end

def sequence(integer)
  arr = [1, integer].sort!
  # Boundaries of range sorted from smallest --> biggest
  sequence = (arr[0]..arr[1]).to_a
  # Creates range, converts to array
  sequence[0] == 1 ? sequence : sequence.reverse
  # Ensure that the sequence begins with 1
end

p sequence(5) # 1..5
p sequence(0) # 0..1
p sequence(-3) # -3..1

