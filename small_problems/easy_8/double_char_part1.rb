=begin

Aim:

Write a method that takes a string, and returns a new string in which every
character is doubled.

Questions:
  - Input
    - Do we need to account for more than one string?
          #No
    - What if input is empty?
          #Double of nothing is still nothing, return an empty string
  - Do all characters need to be doubled, including non-alphanumerics?
        #Yes
  - Where are the doubled characters in the returned string?
    - Immediately following their original character?
          #Yes
  - What is doubled?
    - Does that mean we write the same character twice?
          #Yes

Questions that have come up later:
  - Do we still double characters if they are already positioned next to
    another instance of themselves in the original string?
        #Yes
  - Should case be maintained in the doubled character?
        #Yes

  Rules
    - Input String
    - Output Returned New String
      - all chars doubled
    -
    -
    -

Examples:

repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''

Algorithm
  - Initialize return_string as an empty string
  - Iterate through the characters of input
    - Push each character multiplied by two at return_string
  - return_string
  -
  -

# NOTE: Not sure whether I shouldn't call my variable return_string
  I know there have been notes made about methods that begin with prefix return
  being poor writing style for ruby, because all things implicitly return in
  ruby.
  For this reason I'll give it a different name, doubled_string. Ask about this
  in a comment. Do these message's we've received about avoiding naming methods
  with return go for variables as well?

=end

def repeater(string)
  doubled_string = ''
  string.each_char { |char| doubled_string << (char * 2) }
  doubled_string
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

=begin

# POST-SOLUTION

___First thoughts___
  - There's that style of notation that's real smooth. If you're adding two
    items to a collection, the preferable option if it's available is to
    double shovel:
    doubled_string << char << char
    Nice an easy to read :)
  - LS method called their doubled_string variable result, which they do in
    quite a few of their methods. I guess 
  -
  - I wasn't sure whether there was some clever method that would double the
    string's characters like the opposite of String#squeeze. In the end I
    decided to go with the simple approach of defining a new variable and
    iterating through the input string. Braced myself when I uncovered the
    answer, but turns out, LS did the same thing as me :)
    Simple and clear is good.

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


