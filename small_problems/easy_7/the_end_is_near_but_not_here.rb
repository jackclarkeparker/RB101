=begin

Aim:

Write a method that returns the next to last word in the String passed to it as
an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.

  - input: String
  - output: String
  Rules
    - Input String
      - contains at least two words
      - words are any sequence of non-blank characters
    - Output String
      - The second to last word in the input

Examples:

penultimate('last word') == 'last'
In a two word string, the second to last is the first!

penultimate('Launch School is great!') == 'is'
Happy Path

Algorithm
  - split string
    - reference the second to last element in this array
  -
  -
  -

=end

def penultimate(string)
  string.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

=begin

# FURTHER EXPLORATION



Aim:

Write a method that returns the middle word in a phrase/sentence.

Words are any sequence of non-blank characters.

Our solution ignored a couple of edge cases because we explicitly stated that
you didn't have to handle them: strings that contain just one word, and strings
that contain no words.

Suppose we need a method that retrieves the middle word of a phrase/sentence.
What edge cases need to be considered? How would you handle those edge cases
without ignoring them? Write a method that returns the middle word of a phrase
or sentence. It should handle all of the edge cases you thought of.


Questions:

  - How do you find the middle word in a sentence?
    - Divide by 2?
    - Word which contains the middle character?
      - What if we are finding the middle of a sequence of words/characters
        that are even?
        - Could find out by counting the characters on either side of middling
          word pair, determining which extends further away from the center.
        - Of the middling pair, which has a middle character closer to center?
        - Where does the middle character fall?
  - Middle of a string, or middle of a sentence within a string?
  - What is the middle word in an empty string?
    - ""
  - What is the middle word of a single word string?
    - The single word
  - What is a phrase/sentence?
    - Something that ends with '.', '?', or '!'
    - If there is no sentence ending punctuation, assume the end of the last
      word is the end of the sentence/phrase.
  - What if phrase is given over more than one string?
    - Middle of the concatenation of the multiple strings.
  - What if more than one phrase/sentence is given?
    - Return the middle word from the first phrase/sentence
  - What if extra whitespace is inserted?
    - Squeeze out extra whitespace

  - input: String, ...
  - output: String
  Rules
    Explicit Requirements:
    - Return middle word from a phrase or sentence
    - Word is any sequence of non-blank chars
    -
    -
    Implicit Requirements:
    - Phrase ends either with '.', '?', '!', or if none of these is given,
      then phrase ends at the final word of the string.
      - Where more than one phrase is given, return the middle word of the
        first phrase.
    - The middle word is the word that contains the middle character
      - The middle character can be found in a string of odd length by dividing
        length by 2. Use this as your index.
        - If the middle character falls between two words,
          The word whose middle is closer to the middle character is the middle
          word.
          - If both words are equidistant, there is no middle word.
      - When the string is of even length, the middle will be a set of two char
        not one. The index of the second character can be found by dividing the
        length by 2, for the first character's index, you'll want to subtract
        one from this index.
    - Remove double whitespace

Examples:

middle_word("here is a string") == 'a'
middle_word("This one fun spun") == 'THERE IS NO MIDDLE'
middle_word("bla") == 'bla'
middle_word("") == ""

Algorithm
  - Groom the string.
    - Concatenate all string inputs
    - Delete all characters that follow a sentence_closer
    - Remove double whitespace
    - Remove trailing/leading whitespace
  - Find the middle index / indexes of the phrase.
      - Where odd # of chars, this index is length of string / 2
      - Where even # of chars, this is two chars
        - length of string / 2 - 1
        - length of string / 2
  - Determine which word contains the character/characters at the middle of the
    string.
    - Find a middle index character that is not white space.
      - Search to the left and right of this index to find position of white
        space.
        - slice the characters between this white space for middle word.
    - Where middle index has no non-whitespace, search to the left and right of
      middle index for the two adjacent words.
      - determine their length
        - the shorter of them is the middle word.
        - If they are the same length then print "THERE IS NO MIDDLE"

FORMALIZED
  - SUBPROCESS groom_string
    - SET variable string to concatenation of all input strings.
    - SET variable string to slice of string up to sentence ending punctuation.
    - SET variable string to string without double white space
    - SET variable string to string without trailing or leading white space.
  - SUBPROCESS find_middle_index
    - IF length of string is odd
      - SET middle_of_sentence = [length of string / 2]
    - ELSIF length of string is even
      - SET middle_of_sentence = string.slice((string.length / 2 - 1), 2)
  - SUBPROCESS middle_word
    - SET counter = 0
    - SET middle_word_flag = WHILE counter < 2
      - BREAK if character in string at index(middle_of_sentence at index
        counter) is non-whitespace.
      - SET counter = counter + 1
    - IF middle_word_flag
      - 
  -

=end

def groom_string(*string)
  string = string.join
  string = string[0..string.index(/[!.?]/)]
  string.squeeze!(' ')
  string.strip!
end

p groom_string('  Some words are ', "quite    nice, don't you think?", "I could lay about and dream of a day")

def find_middle_index(string)
  if string.length.odd?
    [string.length / 2]
  else
    second_mid_idx = string.length / 2
    [second_mid_idx - 1, second_mid_idx]
  end
end

p find_middle_index('string')
p find_middle_index('stringy')
p find_middle_index('')
p find_middle_index('words are wind')

# def middle_word(*string)
#   string = groom_string(string)

  

# end

# middle_word("hello")
# middle_word("Barry said that we ought to find a way of moving on. I wasn't quite so sure now though, was I!")