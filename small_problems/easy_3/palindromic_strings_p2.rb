def real_palindrome?(string)
  lower_case_string = string.downcase
  alpha_numeric = lower_case_string.chars.select do |character|
    ('0'..'9').include?(character) || ('a'..'z').include?(character)
  end

  alpha_numeric == alpha_numeric.reverse
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true
p real_palindrome?("Madam, I'm Adam") == true
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

# Post-Solution

# The solution operates with the String#delete method which uses a string rule
# to define a set of characters to remove from a newly returned string - there's
# also String#delete! for destructive purposes.

# The rule that the string argument to this method uses is the same as that used
# in String#count.

# If just one string is passed in, any letters in that string will be removed
# from the returned string. ranges of characters can be captured by using a hyphen
# so that ('a'..'z') is the same as 'a-z'

# The string argument can be prepended with a caret '^' which will negate it,
# rather than deleting the characters that follow, all characters BUT those that
# follow will be deleted.

# Finally, if two arguments are given, then it will be the intersection of these
# strings that will define what to delete, i.e. only the characters in common
# between the strings are included in the ruleset.


# The solution used String#delete to select only alphanumeric characters in it's
# palindromic test like so:
# string = string.downcase.delete("^a-z0-9")
# palindrome?(string)