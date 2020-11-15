=begin

Aim:

Write a method that takes a single String argument and returns a new string
that contains the original value of the argument with the first character of
every word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.

  - input: String
  - output: New String
  Rules
    - Input String
      - string with words in it
      - a word is any sequence of non-blank characters
        - ~ space delimited? white space on whitespace isn't a word
    -
    - Output String
      - New String
      - Same value as original argument, but each word capitalized
        - Uppercase first letter
        - Lower case non-first letters
    -
Examples

word_cap('four score and seven') == 'Four Score And Seven'
Happy Path

word_cap('the javaScript language') == 'The Javascript Language'
Uppercase S in Javascript becomes lowercase

word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
Words that begin with puncutation become all lower case, because no letter
starts the word.

Algorithm
  - split string into words
    - map to capitalize
      - join with whitespace
  -
  -
  -

QUESTION

What if original string had double whitespace somewhere?
Need to preserve it somehow.

=end

def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

=begin

# FURTHER EXPLORATION

Same thing twice without using capitalize

First alternative
  - Lower case all chars
  - Uppercase first char

Second alternative
  - If following white space
  - uppercase char.

=end

def word_cap(string)
  words = string.split

  words.map! do |word|
    word = word.downcase
    word[0] = word[0].upcase
    word
  end

  words.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

def word_cap(string)
  characters = string.downcase.chars
  characters[0].upcase!

  characters.map!.with_index do |char, i|
    char.upcase! if characters[i - 1] == ' '
    char
  end

  characters.join
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

=begin

# Notes

I'm noticing that calling a mutating method on a slice of string has no effect
on the original string. I guess when you reference a part of a string, you
create a new object.

=end