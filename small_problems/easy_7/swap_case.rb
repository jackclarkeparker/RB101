=begin

Aim:

Write a method that takes a string as an argument and returns a new string in
which every uppercase letter is replaced by its lowercase version, and every
lowercase letter by its uppercase version. All other characters should be
unchanged.

You may not use String#swapcase; write your own version of this method.

  - input: String
  - output: New String
  Rules
    - input
      - string
    - output
      - new string
        - same as input, but alphabetical chars case reversed
        - non alphabetic chars unchanged

Example:

swapcase('CamelCase') == 'cAMELcASE'
Happy Path

swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
Happy Path, Non Alpha chars unchanged

Algorithm
  - iterate through the characters of the string
    - transform alphabetic characters into opposite case
      - conditional if a..z elsif A..Z
  - return the string
  -
  -

=end

def swapcase(string)
  string.chars.map do |char|
    if ('a'..'z').include? char
      char.upcase!
    elsif ('A'..'Z').include? char
      char.downcase!
    else
      char
    end
  end.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

=begin

No need to use destructive upcase/downcase calls, the value is returned anyway.

The solution is the same, but it used regex and match operator to determine
whether char was from the set of upper/lower alphabetic characters.

I've tried out using .join at the end of my solution today. It's great to try
things out, high five! Now that we've tried it and looked at the solution, we
can see that it's a little cramped using this syntax in the current situation.
A nice alternative to this is to assign the map call to a new variable, and to
simply call join on this variable at the end of the program. This is more
legible.

Basically used the same solution as LS :)

=end