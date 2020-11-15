=begin

Given a string that consists of some words (all lowercased) and an assortment
of non-alphabetic characters, write a method that returns that string with all
of the non-alphabetic characters replaced by spaces. If one or more
non-alphabetic characters occur in a row, you should only have one space in the
result (the result should never have consecutive spaces).



Aim:
  - input: String
  - output: String
  Rules
    - String input
      - alphabetic / non_alphabetic
      - all alphabetic are lower_cased
      - spaces
    - String output
      - All non_alphabetic replaced by spaces
      - White space clumps between words reduced to single whitespace
      - Leading/trailing white space is fine
    -
    -
Examples:

cleanup("---what's my +*& line?") == ' what s my line '
+ leading and trailing white space
- All non_alphabetic replaced by whitespace
- No consecutive whitespace

Algorithm
  - Assign constant
    - alphabetic_ord_range
  -
  - Split string into characters
  - Where codepoint is not included in alph_ord_range
    - change to white_space
  - Remove consecutive whitespace
=end

ALPHABETIC_ORD_RANGE = (97..122)

def cleanup(string)
  clean_array = string.chars.map do |char|
    if ALPHABETIC_ORD_RANGE.cover?(char.ord)
      char
    else
      " "
    end
  end
  clean_array.join.squeeze(" ")
end

p cleanup("---what's my +*& line?") == ' what s my line '

# Post-Solution
=begin

Great, so I'm happy to have found the constant here, the solution also used a
constant (at least the first solution did). Funny thing though. I added the
ordinal range in, but this was totally unnecessary. We could just as easily use
a range denoted by string characters ('a'..'z').

This first solution managed the output by initializing clean_chars as an empty
array, at the start. This was tidy, less tangled than mine. It then used `<<`
to push each alphabetic element into the clean_chars, or when not an alphabetic
character, it pushed ' ' instead. It dealt with succesive white space by appending
a conditional suffix:
unless clean_chars.last == ' '
It doesn't matter that the return value of this iteration will be nil, we are
not transforming with map, instead we are pushing all of these elements so #each
suffices.

The second solution made use of gsub with a regex to swap all non
alphabetic characters with space, before using the same method that I found -
String#squeeze to remove consecutive whitespace.
Regex will be taught in later courses.

The discussion also made a point of saying that the description didn't specify
whether to return the original string object, or a new object, and that
this would be a pertinent piece of information to ask an interviewer if they
posed an exercise like this.
=end

# Further Exploration
# Since my solution didn't use regex, let's use the regex from the solution,
# rebuild their method.

def cleanup(string)
  string.gsub(/[^a-z]/i, " ").squeeze(' ')
end

p ' what s my line '
p "---what's my +*& line?"
p cleanup("---what's my +*& line?")
p cleanup("---what's my +*& line?") == ' what s my line '
