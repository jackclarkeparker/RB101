=begin

Aim:

Write a method that takes a non-empty string argument, and returns the middle
character or characters of the argument. If the argument has an odd length,
you should return exactly one character. If the argument has an even length,
you should return exactly two characters.

Questions:
  - Do I need to validate the input?
    - Do I need to modify the input if mistakes have been made?
      i.e. double whitespace?
  - If there are escaped characters in the string, should we take the backslash
    into account?
  -

Questions that have come up later:
  -
  -
  -


Rules
### Explicit Requirements:
    - Input: String
  ~ Non-empty string
    - Output: String
  ~ Return Middle character/characters of input:
      - if input is odd length, one character
      - if input is even length, two characters
    -
    -
    -

### Implicit Requirements:
    - If the argument has an odd length, you should return exactly one character.
      - This is the character in the middle of the string
        - The character in the middle of the string is the character padded
          equally on either side.
    - If the argument has an even length, you should return exactly two characters.
      - These are the two characters in the middle of the string
        - Padded on either side of these two characters by an equal number of
          characters.

###M###
##MM##

Examples:

center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'

center_of('\'') == '''

Data Structure:
  -  We've got to find the middle character of a string.
    - The String should suffice
  -
  -

Algorithm

We know we'll need to know:
  - How long the input is.
  - Whether it is even or odd
  - We'll need to select the characters that are in the centre of the string.

  - Where odd, select the character at index (length / 2)
  - Where even, select the two characters at index (length / 2 - 1)
  -
  -

=end

def center_of(string)
  length = string.size

  case
  when length.odd?  then string.slice(length / 2)
  when length.even? then string.slice((length / 2) - 1, 2)
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
p center_of('\'') # == '''

=begin

# POST-SOLUTION

___First thoughts___
  - LS Solution defines a center_index variable to substitute for both instances
    of string.size / 2. The slice call is a little clearer when using a
    descriptive variable like this.
  -
  -
  -

___Mental Model Modifications___
  -
  -

# FURTHER EXPLORATION

Aim:

Questions:
  -
  -
  -
  -

  Rules
    - Input
    - Output
    -
    -
    -

Examples:

Algorithm
  -
  -
  -
  -
  -

=end