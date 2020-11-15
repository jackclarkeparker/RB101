=begin

Aim:

Write a method that takes a positive integer as an argument and returns that
number with its digits reversed.

Don't worry about arguments with leading zeros - Ruby sees those as octal
numbers, which will cause confusing results. For similar reasons, the return
value for our fourth example doesn't have any leading zeros.

Questions:
  -
  -
  -
  -

  - input: Positive Integer
  - output: Integer
    - input integer with digits reversed
  Rules
    Explicit Requirements:
    - Takes argument integer, returns integer reversed
      - 1234 --> 4321
      - Won't be the same integer (Integers are immutable)
    - Argument won't have any leading zeros i.e. won't be Octal or other series
      - Input won't be 01234
    -
    Implicit Requirements:
    - Ignore any leading zeros that result from reverse.
      - 12000 --> 21 # leading zeros are ignored.
    - Where given a single digit number, the output is the same as input.
      - 1 --> 1
    -

Examples:

reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1

Data Structure

- We need to take an integer and reverse the order of it's digits.
  - We can use an array to change the order of each digit.
    1234 --> 4321
    1234 can be represented as [1, 2, 3, 4]

Algorithm
  - initialize 'result' variable
  - push the digits of the integer into 'result'
  - reverse the order of the elements in 'digits'
  - delete any leading zeros
    - intialize current_index
    - iterate through array, deleting the element at current_index until this
      element is something other than zero.
  - join the elements together
  - return the result
=end

def reversed_number(integer)
  result = integer.digits
# This will populate 'result' with the digits of integer in reversed order
  result = delete_leading_zeros(result)
  result.join.to_i
end

def delete_leading_zeros(array)
  while array.first == 0
    array.shift
  end

  array
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

=begin

# POST-SOLUTION

___First thoughts___
  -
  -
  -
  -

___Mental Model Modifications___
  -
  -

# FURTHER EXPLORATION

Aim:

Questions:
  -
  -
  -
  -

  Rules
    - Input
    - Output
    -
    -
    -

Examples:

Algorithm
  -
  -
  -
  -
  -

=end

