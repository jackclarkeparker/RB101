=begin

Aim:

As we have seen previously we can use some built-in string methods to change
the case of a string. A notably missing method is something provided in Rails,
but not in Ruby itself...titleize. This method in Ruby on Rails creates a
string that has each word capitalized as it would be in a title. For example,
the string:

words = "the flintstones rock"

would be:

words = "The Flintstones Rock"

Write your own version of the rails titleize implementation.

Questions:
  - Do I need to return the same object?
  A~The question says 'create a string...' so no.
  - What does word mean in this context?
  A~Whitespace delimited sequence of characters of length (1..)
  -
  -

Questions that have come up later:
  -
  -
  -

Rules
### EXPLICIT:
    - Input: String
    - Output: String
    * Same as input string, but with each word capitalized
    -
    -
    -

### IMPLICIT:
    -
    -
    -

Examples:

words = "the flintstones rock"

would be:

words = "The Flintstones Rock"
Happy path - each word is capitalized

Data Structure:
  - We need to perform the same action on every word in the string.
    - This means we want to iterate.
    - We therefore need to change the string into an array. It will need to
      revert back to a string after the operation has been carried out.
  -
  -

Algorithm
  - Split input string into words array
  - Transform each element in the words array, capitalizing each word.
  - Join the elements back together with whitespace delimiting, into a single
    string.
  -
  -

=end

def titleize(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

words = "the flintstones rock"

p titleize(words) == "The Flintstones Rock"

=begin

# POST-SOLUTION

___First thoughts___
  -
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


