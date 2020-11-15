=begin

Aim:

Modify the method from the previous exercise so it ignores non-alphabetic
characters when determining whether it should uppercase or lowercase each
letter. The non-alphabetic characters should still be included in the return
value; they just don't count when toggling the desired case.

  - input: String
  - output: New String
  Rules
    - Input String
    - Output String
      - Alternating case for alphabetic characters
      - Non-alphabetic characters don't toggle case.
    -
    -
Example:

staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
White space won't alter case toggle

staggered_case('ALL CAPS') == 'AlL cApS'

staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

Algorithm
  - Initialize scrambled_string empty string
  - Instantiate need_upper depending on keyword argument
  - Iterate over the characters of input
    - Where they are non-alpha push to scrambled_case
    - Where need_upper, push an upper case version to scrambled_string
      - reverse need_upper
    - push a lowercase version to scrambled_case_string
  -
  -

=end

def staggered_case(string, case_toggle_all_chars: false)
  scrambled_string = ''
  need_upper = true
  
  string.chars.each do |char|
    if char =~ /[^a-zA-Z]/
      scrambled_string << char
      need_upper = !need_upper if case_toggle_all_chars

    elsif need_upper
      scrambled_string << char.upcase
      need_upper = !need_upper
    else
      scrambled_string << char.downcase
      need_upper = !need_upper
    end
  end
  
  scrambled_string
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

=begin

# Post-Solution

Launchschool used the same sort of idea in their solution. 

One difference that is noteworthy is how they chose to arrange their conditional
structure. They started off with an if statement to target alphabetical chars.
Under the true clause, another if statement divided execution flow, assigning
an uppercase version of a character if need_upper was truthy, and otherwise
assigning a lowercase version of a character. At the end of this sub-conditional,
but still within the original alphabetic conditional, need_upper's value was reversed.
This structure removes the duplicate need_upper reversal operation. And visually
the sub conditional structure and further indentation helped communicate what
the code was doing.

Another point to consider is that I used the concat operator where LS used +=.
In this case, it's not important to modify the return string, because we're not
making changes from a method, but from a block. Reassignment from a block
changes the original variable, because the scope of the original variable is
still available.

# Further Exploration

Build flexibility so that the method can ignore non-alphabetical characters in
it's case toggling, or take them into account.

Algorithm
  - Initialize scrambled_string empty string
  - Instantiate need_upper depending on keyword argument
  - Iterate over the characters of input
    - Where they are non-alpha push to scrambled_case
    - Where need_upper, push an upper case version to scrambled_string
      - reverse need_upper
    - push a lowercase version to scrambled_case_string
  -
  -

=end