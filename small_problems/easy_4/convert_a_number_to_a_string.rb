STRING_DIGITS = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
                  5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' }

def integer_to_string(integer)
  integer.digits.reverse.map { |num| STRING_DIGITS[num] }.join
end

p integer_to_string(0)

# POST-SOLUTION

# They use an array instead of a hash for the conversion structure, relying on the
# fact that the index for each element is the integer value for the corresponding string.

# Also, they manually chop off each successive trailing digit from the given integer by
# looping a divmod(10) call, reassigning the integer each time, and referencing the string element
# of the conversion array by way of it's index as indicated by the modulus (whose numeric value
# matches the corresponding string element).

# This is prepended to the result variable, which is returned.
