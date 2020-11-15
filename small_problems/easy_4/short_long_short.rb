def short_long_short(str1, str2)
  short, long = [str1, str2].sort { |a, b| a.length <=> b.length }
  short + long + short
end

puts short_long_short('abc', 'defgh') == 'abcdefghabc'
puts short_long_short('abcde', 'fgh') == 'fghabcdefgh'
puts short_long_short('', 'xyz') == 'xyz'
puts short_long_short('_i_', 'to') == 'to_i_to'

# Post-Solution

# The solution explains that clarity is more important than density. It uses an
# if/else conditional structure to determine the order that the strings are
# concatenated which is simple and easy to read. 

# The solution also offers an example that uses a sorting algorithm, but suggests
# that such a method is perhaps too clever for its own good and makes it hard to
# understand what the method is trying to do.

# Also, #sort method that I used is more heavy handed than Array#sort_by, which
# allows the specification of a parameter to sort by in it's block.
