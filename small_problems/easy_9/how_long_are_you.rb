=begin

Aim:

Write a method that takes a string as an argument, and returns an Array that
contains every word from the string, to which you have appended a space and the
word length.

You may assume that words in the string are separated by exactly one space, and
that any substring of non-space characters is a word.

Questions:
  - Do words have a minimum length?
  -
  -
  -

Questions that have come up later:
  -
  -
  -

Rules
### EXPLICIT:
    - Input: String
    - Output: Returned Array
    * contains all words found in input string
    * each word is appended with a space and the word length
    - Words are substring of non whitespace chars, delimited by whitespace
      - non whitespace chars, means punctuation will still count as a character
        in a word
    - Words in string are separated by exactly one space
    -

### IMPLICIT:
    - Appended space and word length
      - word length is the number of characters in the word, written as a number
    -
    -

Examples

word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []
empty string returns empty array

Data Structure:
  - Array is returned
    - Number of elements in array is equal to the number of words in string
  - String converting into array of strings
  -

Algorithm
  - split string into array
  - Transform array
    - each element is a string that also contains the length of the string
  - return array
  -

=end

def word_lengths(string)
  array_of_words = string.split(' ')
  array_of_words.map { |word| "#{word} #{word.length}" }
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []

=begin

# POST-SOLUTION

___First thoughts___
  - Same essential solution!
  - It is possible to chain the map call onto the split call.
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