# Pre-Solution

# print "What is your name? "
# name = gets.chomp

# if name.end_with? ("!")
#   puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
# else
#   puts "Hello #{name}."
# end

# Post-Solution
# When I was going through PEDAC, I didn't note that the output didn't include
# an exclamation point in the SHOUTED version of the greeting. This would have
# been achieved by used the String#chop method, which removes the final
# character of a string, and returns the new string.

print "What is your name? "
name = gets.chomp

if name.end_with? ("!")
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end