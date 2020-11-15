=begin

Aim:

Write a method that can rotate the last n digits of a number. For example:

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.

Questions:
  -
  -
  -
  -

Questions that have come up later:
  - Does it matter if the input integer is negative?
  -
  -

Rules
### EXPLICIT:
    - Input: Integer, Integer
    * Input Integer, n is a +ve number that references how many of the digits
      on the right side of integer are to be rotated.
    - Output: Integer
    * Input Integer that has had digits rotated
    - Where n is 1, the original number is returned
    -
    -

### IMPLICIT:
    - Last n digits is a subset of the digits that comprise the input integer.
      - This subset is found by collecting digits from the right side first
      x input: 1234 n: 3 --> subset: 234
    -
    -

Examples:



rotate_rightmost_digits(735291, 1) == 735291
Only the rightmost digit is being rotated, has no new position to inhabit,
nothing changes.

rotate_rightmost_digits(735291, 2) == 735219
Last two digits rotated

rotate_rightmost_digits(735291, 3) == 735912
Last three...

rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

Data Structure:
  - Integer in, integer out. Will be using rotate_array method
  - I've got to select a subset of digits to pass to the rotate array method,
  - 

Algorithm
  1.Initialize a string_num variable with a value of the input converted to a
    string.
  2.Capture and remove the subset of digits that will be rotated.
  3.Rotate these digits
    - Convert to array
    - rotate_array
    - join back together
  4.Add the remaining digits of string_num back together with the rotated digits
  5.Convert to an integer

=end

def rotate_rightmost_digits(integer, digits_to_rotate)
  string_num = integer.to_s

  subset = string_num.slice!(-digits_to_rotate..)
  rotated_digits = rotate_array(subset.chars).join

  (string_num + rotated_digits).to_i
end

def rotate_array(array)
  rotated_array = array.dup

  array.each do |element|
    rotated_index = array.index(element) - 1
    rotated_array[rotated_index] = element
  end

  rotated_array
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

=begin

# POST-SOLUTION

___First thoughts___
  - Feck, again I had questions that I was wondering about, that may well have
    paid to write down, like how else might I represent the range of digits to
    rotate.
  - My solution used quite long variables, and it perhaps these distracted a
    little. LS just used n, for digits, which was fine.
  - Rather than removing the digits, rotating them, and adding them back, LS
    simply used a setter method to change them in place, which made for easier
    to read code.
  - A good thing to think about with regards to data structure is, where in my
    code do I want to transform to an array? There are often different places
    to do this, do you select and then turn to an array, or do you turn
    everything to an array, and select from there?
      - The path you take to manipulate the data will lead to more or less
        legible code. Also it's fine if it's a bit botched when you start.

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


