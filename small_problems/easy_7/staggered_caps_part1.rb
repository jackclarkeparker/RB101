=begin

Aim:

Write a method that takes a String as an argument, and returns a new String
that contains the original value using a staggered capitalization scheme in
which every other character is capitalized, and the remaining characters are
lowercase. Characters that are not letters should not be changed, but count as
characters when switching between upper and lowercase.


  - input: String
  - output: New String
  Rules
    - Input
      - String
    - Output
      - New String
      - staggered capitalization scheme
        - even indexed characters are uppercase
        - odd indexed characters are lowercase
        - non alphabetic characters are unchanged, but do not change the flow
          of up/down case alternation.

Example:

staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
Even indexed characters upcase, odd downcase

staggered_case('ALL_CAPS') == 'AlL_CaPs'
Letters that were upcase can be brought downcase

staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
non alphabetic unchanged

Algorithm
  - Split into characters
  - Transform the characters
    - Where index is even, upcase
    - Where odd, downcase
  - join the characters back together
  -

=end

def staggered_case(string)
  characters = string.chars.map.with_index do |char, i|
    if i.even?
      char.upcase
    else
      char.downcase
    end
  end
  characters.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

=begin

# POST-SOLUTION

The Launch School solution uses an interesting approach that is useful because
it is flexible. It defines a variable need_upper which is set to true at the
start of the program. It also instantiates a result empty string. The method
then iterates through the input string, and adds each character to the result
string, invoking either upcase or downcase depending on the state of need_upper.
At the end of each iteration, need_upper has it's value reversed so that in the
next iteration, the opposite case will be applied to the next character.

The further exploration asks us to modify the solution so that it can request
the order of upcase/downcase be reversed, they suggest doing this with a keyword
argument. Because of how LS's solution has been set up, this requires only the
simple action of changing the initial value of need_upper. Their solution is
flexible, dynamic, because it's outcome depends on a variable that can easily
be changed. My solution is static, it only does what it does. To change the
outcome from my method, I've got to change all of the code.

# FURTHER EXPLORATION

=end

def staggered_case(string, reverse_order: false)
  result = ''
  need_upper = reverse_order ? false : true

  string.each_char do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end

  result
end

p staggered_case('I Love Launch School!')
p staggered_case('ALL_CAPS')
p staggered_case('ignore 77 the 444 numbers')

p staggered_case('I Love Launch School!', reverse_order: true)
p staggered_case('ALL_CAPS', reverse_order: true)

 # BREADCRUMBS, I'm Reading why I need to provide a keyword when invoking keyword arguments.
p staggered_case('ignore 77 the 444 numbers', reverse_order: true)