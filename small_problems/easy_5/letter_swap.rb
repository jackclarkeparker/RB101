=begin

Given a string of words separated by spaces, write a method that takes this
string of words and returns a string in which the first and last letters of
every word are swapped.

You may assume that every word contains at least one letter, and that the
string will always contain at least one word. You may also assume that each
string contains nothing but words and spaces.


Aim:
  - input: String
  - output: String
  Rules
    - input String
      - Characters and spaces only
      - At least one word
      - Just one space separating each word?
        - I'm going to assume yes.
    - output String
      - Original string with the first and last letters of each word swapped
        - Case is unchanged
        - Single character words read the same

Examples:

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
  Each word in the string has first and last letter reversed. Shows one char
  word unchanged.
swap('Abcde') == 'ebcdA'
  Words don't have to be real words
swap('a') == 'a'
  Single character words unchanged

Algorithm
  - Split the input string based on white space
  - Iterate through array
    - remove first and last letter, assigning them to variables
    - append first
    - prepend last

  -
  -
  -

=end

def swap(input_string)
  sub_string_array = input_string.split
  sub_string_array.map! do |word|
    if word.length > 1
      first = word.slice!(0)
      last = word.slice!(-1)
      word.prepend(last)
      word << first
    else
      word
    end
  end
  sub_string_array.join(" ")
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# Post-Solution
=begin
I had been wondering about a line of code similar to what the solution uses:
word[0], word[-1] = word[-1], word[0]
The two assignments in this statement occur simultaneously. If assigned on two
lines, the flow of execution would change the value of the first character
before giving the program a chance to retrieve it, and when the subsequent line
attempted to retrieve the character at index[0], it would simply be passing it's
own value back on itself.

The solution says that this is a variant of multiple assignment. The two
values on the right of the assignment operator aren't in an array, so Ruby
interprets them in a 'temporary array' for the purposes of this operation.
Again, the variables will be assigned to the elements at the corresponding
index. The return value of this assignment is an array of the values on the
right of the assignment operator, just as if these values were represented in
an array.
=end

# Further Exploration
=begin

An implementation that passed only the values being swapped into the method
would be problematic - the assignment that takes place in this array is non
destructive, so the method relies on it's return value to affect the values
outside. Simply swapping the values around within a separate method would have
no effect on the letters in the external context. If the implementation was
built this way, you'd need to make use of the return value of the swap_first_last_characters
method, which is a tuple consisting of the last and first characters of the
word. This would be needlessly laborious. Like writing this out in detail.

end