=begin

Aim:

If you take a number like 735291, and rotate it to the left, you get 352917.
If you now keep the first digit fixed in place, and rotate the remaining
digits, you get 329175. Keep the first 2 digits fixed in place and rotate again
to 321759. Keep the first 3 digits fixed in place and rotate again to get
321597. Finally, keep the first 4 digits fixed in place and rotate the final 2
digits to get 321579. The resulting number is called the maximum rotation of
the original number.

Write a method that takes an integer as argument, and returns the maximum
rotation of that argument. You can (and probably should) use the
rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

Example:

max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

Questions:
  - Does it matter if we perform the rotation on the last digit of the number?
  A~We've been told to do it until we swap the last two digits.
  -
  -
  -

Questions that have come up later:
  -
  -
  -

Rules
### EXPLICIT:
    - Input: Integer
    - Output: Integer
    * The output should be 'maximum rotation' of the original number.
    - Maximum rotation:
      - Rotate the whole number
      - Rotate all but the first digit of the number
      - Rotate all but the first two digits of the number
      - Rotate all but the first three digits of the number
      - ...
    - Leading zero's are dropped.
      - Multiple 0s don't need to be handled.
    -
    -

### IMPLICIT:
    - Object doesn't need to be the original, we've been told explicitly to use
      the methods already designed in earlier methods
    -
    -

=>/352917
=>3/29175
=>32/1759
=>321/597
=>3215/79
=>32157/9 ?? # This one as well?


Examples:

max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

Data Structure:
  - We need a way of repetitively calling our rotate_rightmost_digits method
  - This will involve passing the return value of the last cycle again, and
    decrementing the digits_to_rotate by 1 until we've rotated the last two
    digits.
  -

Algorithm
  1. Initialize result variable with a value of the input integer
  2. Initialize a digits_to_rotate variable with a value equal to the number of
     digits in the input.
  3. Rotate the rightmost digit_to_rotate
  4. decrement the digits_to_rotate
  5. Repeat steps 3 and 4 until the digits_to_rotate is less than 2
  6. Return the result variable

=end

def rotate_array(array)
  rotated_array = array.dup

  array.each do |element|
    rotated_index = array.index(element) - 1
    rotated_array[rotated_index] = element
  end

  rotated_array
end

def rotate_rightmost_digits(number, digits_to_rotate)
  subset = number.slice!(-digits_to_rotate..)
  rotated_digits = rotate_array(subset.chars).join

  (number + rotated_digits)
end

def max_rotation(number)
  string_num = number.to_s
  digits_to_rotate = string_num.size

  until digits_to_rotate < 2
    string_num = rotate_rightmost_digits(string_num, digits_to_rotate)
    digits_to_rotate -= 1
  end

  string_num.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
p max_rotation(100)
=begin

___Lingering Questions___
  1. Another way to find the number of digits in an integer?
    - #digits.size
    LS used the same method chain of #to_s.size
  2. Is it a good idea to assign the result to the integer at the start?
    - This allows us to loop the logic of passing the result into the rotate
      method.
      - If we didn't assign result to the integer, it would instead
  3. It's good to define your helper methods before your meta methods, so that
     the reader can understand what the meta method does by the time they
     arrive there.

# POST-SOLUTION

___First thoughts___
  - LS used downto for this loop, which decrements a number for you, rather
    than having to manually write this out like I did above ^^ It also contains
    the break condition in the name, setting when the loop will cease.
  -
  -
  -

___Mental Model Modifications___
  -
  -

# FURTHER EXPLORATION

Aim:

Assume you do not have the rotate_rightmost_digits or rotate_array methods. How
would you approach this problem? Would your solution look different? Does this
3 part approach make the problem easier to understand or harder?

I think it makes the problem easier to understand. You concretize different
portions and can understand them in isolation. Approaching this problem without
building these helper methods may be possible, but it would likely look like
frankenstein's creation.

There is an edge case in our problem when the number passed in as the argument
has multiple consecutive zeros. Can you create a solution that preserves zeros?

Woops! I implemented this above in the original code, the way to make
consecutive zeros work is to leave the rotating number as a string until you
return it.

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


