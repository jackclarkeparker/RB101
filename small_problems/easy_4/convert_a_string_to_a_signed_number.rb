# DIGITS = {
#     '0' => 0, '1' => 1, '2' => 2,
#     '3' => 3, '4' => 4, '5' => 5,
#     '6' => 6, '7' => 7, '8' => 8,
#     '9' => 9
#   }

# def string_to_integer(string_number)
#   remove_decimals(string_number) if string_number.include? '.'
#   negative = true if negative?(string_number)

#   string_digits = string_number.chars.reverse

#   if negative
#     integer = -iterate_to_integer(string_digits)
#   else
#     integer = iterate_to_integer(string_digits)
#   end
# end

# def negative?(string)
#   if string.start_with?('-')
#     true
#   else
#     false
#   end
# end
# I didn't need to use this method here, this is a simple program, and an operation
# to determine whether the string begins with '-' is at the same level of context
# as the other operations in the program. When working with a bigger program and
# methods that are at a higher level of abstraction, where the existence of the
# negative sign will have implications for bigger functions in our code, that is
# where it may pay to push this method into it's own subprocess, so as not to clog
# the readability of the main execution flow of the overarching program. In a program
# of this size, there is no need to raise abstraction for this.

# def iterate_to_integer(string_digits)
#   accumulator = 0
#   magnitude = 1

#   string_digits.each do |char|
#     current_digit = DIGITS.fetch(char, 0)
#     accumulator += current_digit * magnitude
#     magnitude *= 10
#   end
#   accumulator
# end

# def remove_decimals(string_float)
#   while string_float.include? "."
#     string_float.chop!
#   end
# end

# p string_to_integer('12345')
# p string_to_integer('-12345')
# p string_to_integer('12345.4324')
# p string_to_integer('-12345.123')
# p string_to_integer('+12345')


# # Further Exploration

# def string_to_signed_integer(string)
#   if string[0] == '-'
#     -
#   end
#   string_to_integer(string)
# end

# def string_to_signed_integer(string)
#   case string[0]
#   when '-' then -string_to_integer(string[1..-1])
#   else          string_to_integer(string)
#   end
# end

# def string_to_signed_integer(string)
#   array = %w(1 2 3 4 5 6 7 8 9 0)

#     sign = string.slice!(0)
#   end

#   integer = string_to_integer(string)

#   if negative
#     -string
#   else
#     string
#   end
# end

# Think, multiply by 1 if positive, by negative one if -



# How to negate the method in the same stroke as removing if a plus

# In our solution, we call string[1..-1] twice, and call string_to_integer
# three times. This is somewhat repetitive. Refactor our solution so it only
# makes these two calls once each.
require "pry"

DIGITS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
           '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

def string_to_integer(string)
  split_numbers = string.chars.map { |char| DIGITS[char] }
  split_numbers.inject { |sum, num| 10 * sum + num }
end

def string_to_signed_integer(string)
  new_string = ['-', '+'].include?(string[0]) ? string[1..-1] : string
  string[0] == '-' ? -string_to_integer(new_string) : string_to_integer(new_string)
end

p string_to_integer('13425')

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end


sign = string.shift if ['-', '+'].include? string[0]

integer = string_to_integer(string)

if sign == '-'
  -integer
else
  integer
end
