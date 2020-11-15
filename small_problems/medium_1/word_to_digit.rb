=begin

Aim:

Write a method that takes a sentence string as input, and returns the same
string with any sequence of the words 'zero', 'one', 'two', 'three', 'four',
'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

word_to_digit('Please call me at five five five one two three four. Thanks.')
== 'Please call me at 5 5 5 1 2 3 4. Thanks.'

Questions:
  - How is "sequence" defined in this context?
    - Does a number have to be adjacent to another number to be converted?
    - Do these words have to appear in the same order as they showed up in the
      description?
  - If a string of characters matching one of the words in the description
    appears as part of a greater word, should it be converted?
      - If so, what happens to the remaining characters of the encapsulating
        word?
      - Perhaps the conversion words might appear alongside one another?
  - How is 'word' defined in this context?
    - Any sequence of whitespace delimited characters?
    - Any sequence of whitespace/punctuation delimited characters?

  - How should I handle case discrepancy?

Rules
### EXPLICIT:
    - Input: Sentence string
    * 
    - Output: Same string with word numbers replaced by numeral numbers.
    * 'five' --> '5'
    - 
    - 
    - 

### IMPLICIT:
    - Conversion words can appear directly alongside punctuation, perhaps within
      other words too.
    - 
    - 

Examples:

word_to_digit('Please call me at five five five one two three four. Thanks.')
== 'Please call me at 5 5 5 1 2 3 4. Thanks.'
Conversion of "four." to "4." shows that conversion words can appear alongside
other characters and still be converted.

Data Structure:
  - Same string need to be returned
  - Replace given substrings with other substring
  - Conversion structure
  - iteration over the string

Algorithm
  1. initialize NUMBERS as a conversion hash
  2. Replace each word number in the string with it's numeric counterpart
     - Search the string for a match with a given word number
     - Where a word number is found, replace this with a numeric string
  3. 
  4. 
  5. Return the string

=end

NUMBERS = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}

def word_to_digit(sentence)
  NUMBERS.each_pair do |word, digit|
    sentence.gsub!(/\b#{word}\b/, digit)
  end

  sentence
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') \
== 'Please call me at 5 5 5 1 2 3 4. Thanks.'

=begin

___Lingering Questions___
  1. 
  2. 
  3. 

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
    - Input: 
    * 
    - Output: 
    * 
    - 
    - 
    - 

Examples:



Algorithm
  1. 
  2. 
  3. 
  4. 
  5. 

=end


