def palindromic_number?(integer)
  string_integer = integer.to_s
  string_integer == string_integer.reverse
end

p palindromic_number?(34_543) == true
p palindromic_number?(123_210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

# Post-Solution

# I still haven't gone with their style of copying the original palindrome method
# over to avoid writing the line_3 in each exercise. Not very DRY. 


# Further Exploration

p palindromic_number?(010) == true

# If you start a number with one or more 0s, you're writing an octal
# representation of an integer. You can pass an octal number into this method,
# but it will only test whether the base 10 version of the number is palindromic,
# not whether the octal version is. This is because octal numbers are
# interpretted by Ruby in radix base 10 form.

# You might say that this method will recognize octal numbers when the number
# in question is less than 9, so long as you discount the preceding zero, these
# numbers are the same whether in octal or base 10 form, and they are
# palindromic.
# If we need to include the preceding zero as part of the palindromic evaluation,
# the octal number 010 will be correctly recognized as a palindrome.
# Perhaps there are other palindromic octals out there as well.
# They all would need to end in 0.
# Or perhaps, the equivalent number of 00s as would precede them.
# The problem might be interpretted that there is no way of working out how many
# 0s preceded the 

# Can you construct an octal calculator?

def octal_representation(integer)
  octal_digits = []
  loop do
    integer, digit = integer.divmod(8)
    octal_digits.unshift(digit)

    if integer < 8
      octal_digits.unshift(integer)
      break
    end
  end

  octal_number = octal_digits.join
end

def remove_trailing_zeroes(octal)
  while octal.end_with?('0')
    octal.chop!
  end
  octal
end

def palindrome?(number)
  p number == number.reverse
end

def octal_palindrome?(integer)
  octal_number = octal_representation(integer)
  octal_number = remove_trailing_zeroes(octal_number)
  palindrome?(octal_number)
end

# Having been pointed to #Integer.to_s(8), reconfigured.

def octal_palindrome?(integer)
  octal_number = integer.to_s(8)

  if !octal_number.end_with?('0')
    return false
  else
    while octal_number.end_with?('0')
      octal_number.chop!
    end
  end

  octal_number = octal_number.reverse
end
