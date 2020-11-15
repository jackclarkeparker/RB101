=begin

Aim:

Write a method that takes a string argument, and returns true if all of the
alphabetic characters inside the string are uppercase, false otherwise.
Characters that are not alphabetic should be ignored.

Questions:
  - What to do about an empty string?
    - Has no alphabetic characters in it to be uppercase or otherwise..
      - return true
  - What about a string that contains only non-alphabetic characters?
    - We'll go with the empty string logic:
      - No lowercase letters, even if there are no uppercase letters, returns
        true.
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
    - Output: Boolean
    * true if all alphabetic characters of input are uppercase, false otherwise
    - Non-aplhabetic characters are ignored in uppercase check
    -
    -

### IMPLICIT:
    - Empty string is true
    -
    -

Examples:

uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true
input:')()(' --> output:true

Data Structure:
  - pattern matching, we're working with strings here.
  -
  -

Algorithm
  - Determine whether string contains any lowercase alphabetic characters
    - Search string for lowercase alphabetic characters
  - If it does, return false
  - Otherwise, return true
  -
  -

=end

def uppercase?(string)
  string =~ /[a-z]/ ? false : true
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
p uppercase?(')()(') == true

=begin

# POST-SOLUTION

___First thoughts___
  - Solution uses a simple trick
    - Does string.upcase == string?
  -
  -
  -

___Mental Model Modifications___
  -
  -

# FURTHER EXPLORATION

Food for thought: in our examples, we show that uppercase? should return true
if the argument is an empty string. Would it make sense to return false
instead? Why or why not?

An empty string doesn't contain any lowercase or uppercase characters.
Perhaps with a method named uppercase? it doesn't make sense to have a string
without any uppercase characters return true.
If we want empty strings to return true from out method, then maybe we could
instead call it something like not_lowercase? as this would capture the state
of empty_strings / strings without any alphabetic characters
Then again, maybe a method called not_lowercase? would be a little confusing to
invoke. Another option would be to include a comment noting that the method
returns true so long as there are no lowercase characters.

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


