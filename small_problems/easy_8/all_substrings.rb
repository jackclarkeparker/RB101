=begin

Aim:

Write a method that returns a list of all substrings of a string. The returned
list should be ordered by where in the string the substring begins. This means
that all substrings that start at position 0 should come first, then all
substrings that start at position 1, and so on. Since multiple substrings will
occur at each position, the substrings at a given position should be returned
in order from shortest to longest.

You may (and should) use the leading_substrings method you wrote in the
previous exercise:

Questions:
  - Should substrings be separated in any way, i.e. in their own array within a
    2 dimensional structure?
      No
  - 
  -
  -

  - input: String
  - output: Array
  Rules
    - Input String
    - Output Array
      - Array of all substrings
        - Substrings are portions of the string
        - Look for a substring of every length available at every position
          available.
        - Returned array is order by position of the starting index, and then
          by shorted to longest.
    - Use the method from the last exercise.
    -
    -

Examples:

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

Algorithm
  - Initialize list of all_possible_substrings
  - Initialize starting_index at 0
  - Loop
    - Pass string from starting_index to leading_substrings method
      - Push return value to all_possible_substrings array
      - increment starting_index by 1
  - return all_possible_substrings
  -

=end

def leading_substrings(string)
  list_of_substrings = []
  substring_length = 1
  while substring_length <= string.length
    list_of_substrings << string.slice(0, substring_length)
    substring_length += 1
  end
  list_of_substrings
end

def substrings(string)
  all_possible_substrings = []
  0.upto(string.length) do |index|
    all_possible_substrings.concat(leading_substrings(string[index..]))
  end
  all_possible_substrings
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

# POST-SOLUTION

# One benefit that the LS solution has is that it assigns a variable name to
# the substrings that are passed into the helper method. This makes it more
# clear to read, and understand.