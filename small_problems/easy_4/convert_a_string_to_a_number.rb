# input - string of numeric digits 
#   • no invalid characters, no leading + or -
#   • numeric includes floats.

# output - integer conversion returned

# Rules
# 1. No Integer() or String#to_i
# 2. calculate the result by analyzing the characters in the string.
# 3. Floats are numeric, and will need to be converted to integers.
# This is the same as removing all characters from the decimal point onwards
# and converting what remains.
# 4. Numbers are not mutable, so we cant modify them. How will we assign each
# successive character? By adding them together? Depending on the index of the
# string character, multiplying the corresponding digit by a number that starts
# with 1 and is followed by enough 0s.

# '4326'
# '4' => 4
# 4 * 1000
# '3' => 3
# 3 * 100
# '2' => 2
# 2 * 10
# '6' => 6
# 6

# Questions

# Mental Model
# Take a string of numeric characters without a leading + or -, and convert them
# into an integer by analyzing the characters in the string. Do not make use of
# conversion methods such as String#to_i, or Integer()

# Examples
# string_to_integer('4321') == 4321
# string_to_integer('570') == 570
# string_to_integer('13.79') == 13
# string_to_integer('0') == 0

# Data Structure
# Lookup table, and iterate through the array of characters.

# Algorithm
# 1. build a key-value String => Integer table for each digit called 
# 2. split the numeric string at each character and reverse the order of characters
# 3. initialize magnitude variable
# 4. initialize integer variable
# 5. iterate through array of characters
#   - reassign integer with converted character x magnitude plus integer value
#   - multiply magnitude by 10

# return the integer

# PRE-SOLUTION

def remove_decimal(string_float)
  while string_float.include? "."
    string_float.chop!
  end
end

def lookup(char)
  conversion_table = {
    '0' => 0, '1' => 1, '2' => 2,
    '3' => 3, '4' => 4, '5' => 5,
    '6' => 6, '7' => 7, '8' => 8,
    '9' => 9
  }

  conversion_table[char]
end

def string_to_integer(string_number)
  remove_decimal(string_number) if string_number.include? '.'

  string_digits = string_number.chars.reverse
  final_integer = 0
  magnitude = 1

  string_digits.each do |char|
    digit = lookup(char)
    final_integer += digit * magnitude
    magnitude *= 10
  end

  final_integer
end

# p string_to_integer('4321') == 4321
# p string_to_integer('570') == 570
# p string_to_integer('13.79') == 13
# p string_to_integer('0') == 0

# Post-Solution

# They used a constant at the start of the program to assign the lookup hash. We don't need a method for the lookup.

# They had a neat way of assigning the right magnitude for each digit,
# They didn't reverse the digits and multiply by a magnitude multiplied by 10 with each sucessive index.
# They multiplied the whole by 10 each time, and began with the first digit.
# With the very first multiplication, the whole was zero, so the first digit was just itself.

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3,
  '4' => 4, '5' => 5, '6' => 6, '7' => 7,
  '8' => 8, '9' => 9, 'a' => 10, 'b' => 11,
  'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15
}

def hexadecimal_to_integer(hexadecimal)
  digits = hexadecimal.chars.map { |char| DIGITS[char.downcase] }

  values = [0]
  digits.each do |digit|
    values.map! { |numbers| numbers * 16 } << digit
  end

  values.sum
end

p hexadecimal_to_integer('4D9f') == 19871
