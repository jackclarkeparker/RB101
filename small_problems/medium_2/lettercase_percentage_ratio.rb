=begin

Aim:

In the easy exercises, we worked on a problem where we had to count the number
of uppercase and lowercase characters, as well as characters that were neither
of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3
entries: one represents the percentage of characters in the string that are
lowercase letters, one the percentage of characters that are uppercase letters,
and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

Questions:
  - How to represent percentage?
  A In a key-value pair where the key is the type of char and the value is an
    integer/float representing the percentage of those chars in the string.
  - How should I handle an empty string?
    - Does it contain 100% neither uppercase nor lowercase?
    - Does it contain 0% of all types?
  A - Don't need to! String will always contain at least one char
  - How accurate do my numbers need to be?
    - Shall I round to 2 dp?
    A 2dp is good
    - What if my rounding causes the numbers to add up to a number that isn't
      100?
    A Don't worry about it, I guess?
  - 

Rules
### EXPLICIT:
    - Input: String
    * String of chars
    - Output: Hash
    * Contains 3 k/v pairs, showing percentages for lowercase, uppercase, and
      non-letter chars.
    - Input always contains at least one char
    - 
    - 

### IMPLICIT:
    - Percentage of each char type is shown as a number
      (can be float or integer)
    - 
    - 

Examples:

letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
White space is neither, digits are neither

letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
Percentages can be represented as floats

letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
Happy Path

Data Structure:
  - I'll need to have a way of finding percentages for characters.
  - The return value is a hash.
  - I'll iterate over the string.
  - I'll need a conditional to determine whether a given character is
    lowercase, uppercase, or neither.

Algorithm
  2. Find the number of characters that are lowercase, uppercase, and neither
     in the string.
     - Initialize a variable whose value is the number of characters in the
       string that are lowercase.
       - Repeat for uppercase chars and neither chars
  3. Find percentages for each character type
     - Divide the number of characters in each group by the total number of
       characters in the string.
     - Round to 2 dp
  4. Initialize a percentages hash containing the percentage for each
     character type.
  5. 




NOTES
percentage is returning the correct number, but it is a float i.e. 50.0
We want whole numbers to be rep'd as integers, not floats.

Want a method that will turn a round float into an integer.

Algorithm:
1. conditional - Where the number is equal to the integer version of itself,
   convert the number to an integer
   Otherwise, return the float
2.

=end

def character_counts(string)
  count = {}

  count[:lowercase] = string.count('a-z')
  count[:uppercase] = string.count('A-Z')
  count[:neither] = string.count('^a-zA-Z')

  count
end

def letter_percentages(string)
  character_distribution = character_counts(string)
  result = {}
  total_chars = string.size

  character_distribution.each_pair do |char_type, number_of_chars|
    percentage = (number_of_chars.fdiv(total_chars) * 100).round(2)
    percentage = proper_number_format(percentage)

    result[char_type] = percentage
  end

  result
end

def proper_number_format(number)
  number == number.to_i ? number.to_i : number
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
p letter_percentages('abcdefGHI')

=begin

___Lingering Questions___
  1. Is there a better way of finding the percentage with the correct type
     without needing to resort to a method like `proper_number_format`?
  2. Could we have used tally to solve this problem? Don't think so.
  3. 

# POST-SOLUTION

___First thoughts___
  - Clean words, counts, percentages, characters, length. Maybe it's best if
    you create easily understandable simple variables and perform operations
    on them rather than building the specifically and perfectly implemented
    variable / method with a complex name description that is harder to read.
    Over-engineering?
    - Maybe you don't want to tuck all the loose ends away. Maybe doing so
      babyfies the code, so that it's not designed to be understood. You want
      to be able to read the code and understand what it does in real time, you
      don't do this by hiding everything away.
  - It's good to assign all your variables / instantiate things at the start of
    the method, that's like prep for the method, group all the prep together.
    - If you have prep that's spaced out, it can be confusing.
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


