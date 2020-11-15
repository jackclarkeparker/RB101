=begin
Aim:
  - input: String
  - output: Integer
  Rules
    - Sum ASCII str value of each char in str
    - String#ord determines ASCII str value
    - 
    -
Examples

ascii_value('Four score') == 984
# ASCII value of each character in 'Four score'
ascii_value('Launch School') == 1251
# Same as above
ascii_value('a') == 97
# value of 'a'
ascii_value('') == 0
# empty string value - 0

Algorithm
  - split str in arr
  - iterate over arr
    - determine ASCII value of each char
  - add values together
  -
=end



def ascii_value(string)
  string.chars.map(&:ord).reduce(0, :+)
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Post-Solution

=begin
I didn't realise that I needed to account for an empty string being equal to
0, thinking that the ord would return this, however, String#ord needs a string
to operate on. I had assigned an original accumulator value of 0 to my reduce
method, so I never realised #ord wasn't giving a value of 0 to the empty string.
=end

# Further Exploration

=begin

char.ord.mystery == char

Which method can be substituted with `mystery` in order to make the above code
return true?

The mystery method in this example is Integer#chr, which interprets the receiver
as a codepoint reference to a character, and returns this character. An optional
encoding argument can be passed to this method to determine which standard of
codepoints to interpret through.

Where the receiver is a multicharacter string, the expression will be unable
to return true, because #ord will only return the ASCII value of the first char
and #chr only operates on a character by character basis.
=end
