=begin

Aim:

A double number is a number with an even number of digits whose left-side
digits are exactly the same as its right-side digits. For example, 44, 3333,
103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless
the argument is a double number; double numbers should be returned as-is.

Note: underscores are used for clarity above. Ruby lets you use underscores
when writing long numbers; however, it does not print the underscores when
printing long numbers. Don't be alarmed if you don't see the underscores when
running your tests.

Questions:
  -
  -
  -
  -

Questions that have come up later:
  -
  -
  -

Rules
### Explicit Requirements:
    - Double number:
      - Number with even number of digits,
        - whose left-side digits are the same as it's right-side digits.


    - Input: Integer
    - Output: Integer
    ~ When input is double number, returns as is,
      Otherwise return Integer with double input value.
    -
    -
    -

### Implicit Requirements:
    -
    -
    -

Examples:

twice(37) == 74
input doubled

twice(44) == 44
double_number ~ return input

twice(334433) == 668866
input doubled

twice(444) == 888
input doubled

twice(107) == 214
input doubled

twice(103103) == 103103
double_number ~ return input

twice(3333) == 3333
double_number ~ return input

twice(7676) == 7676
double_number ~ return input

twice(123_456_789_123_456_789) == 123_456_789_123_456_789
double_number ~ return input

twice(5) == 10
input doubled

Data Structure:
  - Need to determine whether input is a double number
    - Does input have even number of digits?
    - Are left-side and right-side equivalent?
    - Options:
      - Convert to string and reference halves by element reference
      - Convert to array, join portions of array to compare
  -
  -

Algorithm
  - Determine whether input is a double_number
    - Does input have even number of digits?
    - Are left-side and right-side equivalent?
  - When input is double_number return as is
  - Otherwise, return double input
  -
  -

=end

def twice(integer)
  double_number?(integer) ? integer : integer * 2
end

def double_number?(integer)
  string_num = integer.to_s

  length = string_num.length
  left_side = string_num.slice!(0, length / 2)
  right_side = string_num

  (left_side == right_side) && length.even?
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

=begin

# POST-SOLUTION

___First thoughts___
  - My length.even? condition is arbitrary, if left_side and right_side are
    equal, this already indicates an even number of digits.
  - LS solution uses #size / 2 to define center variable
    - with this they can assign left_side to string_num[0..center - 1]
      and right_side to string_num[center..]
      - This is a nice way of finding the sides, my way is also good. I ruled
        out using a range to capture my sides when I realised that length / 2
        gave the length of a side, and decided to use this as a second arg
        in the slice call.
        Perhaps this shows that it's good to keep open to different ways of
        implementing. Not too important tbh.
        WAH I just saw someone elses solution, they did the same as me, only
        their right side is captured by using slice(half, half)
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


