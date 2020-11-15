=begin

Aim:

A featured number (something unique to this exercise) is an odd number that is a
multiple of 7, and whose digits occur exactly once each. So, for example, 49 is
a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple
of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next
featured number that is greater than the argument. Issue an error message if
there is no next featured number.

Questions:
  - Can input be negative?
  - Can featured numbers be negative?
  - 
  - 

Rules
### EXPLICIT:
    - Input: Integer
    * Single integer
    - Output: Returned Integer, or Printed Error Message
    * Next featured number that is greater than input / error message that 
      there is no next featured number

    - Rules for a featured number:
      - Odd number
      - Multiple of 7
      - It's Digits occur exactly once each
    - 
    - 
    - 

### IMPLICIT:
    - If the input has more than 10 digits, then we'll need to issue the error
      message for sure.
    - 9 digit numbers do have a next featured number
    - 

Examples:

featured(12) == 21
odd, multiple of seven, each digit only once - Happy path

featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

Data Structure:
  - We're searching for a number that meets a set of conditions.
  - We'll need to iterate in order to find it. Loop iteration.
    - Or potentially a sequence of numbers found with Numeric#step
  - I'll say a loop. Maybe it can be refactored into a #step method afterwards




- We might iterate by adding 14 to an odd multiple of seven and testing to
      see whether it's 

Algorithm

Input: Integer

  1. Assign current_number to the first odd multiple of seven that is greater than input
  2. Check to see whether the current_number has unique digits
  3. If so, return the current_number
  4. If not add 14 to the current number
  5. Repeat steps 2-4
  6. If the current_number is greater than 9_999_999_999, print error message

Output: Integer / printed error message


Find the first number that is greater than input which is an odd multiple of seven

Input: Integer

Output: Integer

Rules:
  - output must be:
    - Greater than input
    - odd
    - a multiple of seven

Algorithm:
1. Assign the current_number to 1 greater than the input
2. Unless the current_number is odd and a multiple of seven
   - Increment the current_number


=end

require 'pry'
require 'pry-byebug'

def featured(input)
  current_number = first_odd_multiple(input)
  loop do
    if unique_digits?(current_number)
      return current_number
    else
      current_number += 14
    end

    if current_number > 9_999_999_999 
      break puts "There is no possible number that fulfills those requirements"
    end
  end
end

def first_odd_multiple(input)
  number = input + 1

  until number.odd? && number % 7 == 0
    number += 1
  end

  number
end

def unique_digits?(number)
  number.digits.uniq! == nil
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

=begin

___Lingering Questions___
  1. 
  2. 
  3. 

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
    - Input: 
    * 
    - Output: 
    * 
    - 
    - 
    - 

Examples:

Algorithm
  1. 
  2. 
  3. 
  4. 
  5. 

=end


