=begin

Aim:

Write a method that returns a list of all substrings of a string that start at
the beginning of the original string. The return value should be arranged in
order from shortest to longest substring.

Questions:
  - Is the list an Array?
    - Yes
  - Do substrings need to be complete words?
    - No
  - Is an empty string a substring?
    - No
  - Is the entire string a substring?
    - Yes
  - If empty string passed in, empty array returned?

  - input: String
  - output: Array of strings
  Rules
    - Input String
    - Output ~ Returned Array
      - Array of substrings
        - Substrings start at index 0 of String
        - Substrings are of incrementing length
        - Ordered from shortest to longest
    -
    -

Examples:

leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

Algorithm
  - instantiate list_of_substrings empty array
  - instantiate substring_length = 1
  - while substring_length is less than or equal to length of string
    - find substring that starts at index 0 and is of substring_length
    - push substring to list_of_substrings array
    - increment substring_length
  - return list_of_substrings
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

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# POST SOLUTION

# The Launch School solution is really similar, but it utilises Integer#upto
# instead of a while loop, which is a sensible choice of iterator. I guess a
# takeaway from reading their solution is that it may be worth considering a
# number of different iterating options to select from and work out which fits
# neatly with the problem.
