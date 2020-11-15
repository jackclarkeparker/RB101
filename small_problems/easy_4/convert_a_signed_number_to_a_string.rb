STRING_DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(integer)
  value = ''
  loop do
    integer, modulus = integer.divmod(10)
    value.prepend(STRING_DIGITS[modulus])
    break if integer == 0
  end
  value
end

def signed_integer_to_string(integer)
  return integer_to_string(integer) if integer == 0
  sign = integer > 0 ? '+' : '-'
  sign + integer_to_string(integer.abs)
end

p signed_integer_to_string(123)
p signed_integer_to_string(+123)
p signed_integer_to_string(-123)
p signed_integer_to_string(0)

# Further Exploration

def signed_integer_to_string(number)
  sign = case number <=> 0
         when -1 then '-'
         when +1 then '+'
         else         ''
         end
  sign + integer_to_string(number.abs)
end