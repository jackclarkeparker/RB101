=begin

Write a method that takes a string argument and returns a new string that
contains the value of the original string with all consecutive duplicate
characters collapsed into a single character. You may not use String#squeeze
or String#squeeze!.

Aim:
  - input: String
  - output: String
  Rules
    - Input String
    - Output String
      - Same as input string, but remove all duplicate characters.
    - QuEsTiOn? Double space removed? I guess so.
    -

Examples:

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
Happy Path

crunch('4444abcabccba') == '4abcabcba'
Doesn't matter if there are repeated characters that are not consecutive.

crunch('ggggggggggggggg') == 'g'
Lots of duplicates removed!

crunch('a') == 'a'
No duplicates, nothing changed

crunch('') == ''
Empty string input ~ empty string output

Algorithm
  - iterate through String characters
    - Delete any characters that are consecutive duplicates
  - Return String
  -
  -
  -

=end

def crunch(string)
  crunched_string = ''

  string.each_char do |char|
    crunched_string << char unless crunched_string.last == char
  end

  crunched_string
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

=begin

# Further Exploration

Here is Launch School's Solution:

def crunch(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end

It's important to cease the last iteration in Launch School's solution before
the index is equal to the length of `text`, otherwise, the conditional suffix
will return true when slicing for two characters at indexes that do not exist
for the string (both returning nil), and the program will return a TypeError
when it tries to concatenate nil to the string.

LS didn't want to use each_char with their solution because their solution
constructed it's own iteration cycle using while and the index variable.

I'm not going to delve into regex right now.