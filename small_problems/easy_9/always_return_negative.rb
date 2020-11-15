=begin

Aim:

Write a method that takes a number as an argument. If the argument is a
positive number, return the negative of that number. If the number is 0 or
negative, return the original number.

Questions:
  - Input:
    - Floats and Integers?
    Possibly?
    - Can it be a string number?
    No?
      - If so, do we need to return as a string?
    - Can it be a number from a different series? i.e. Binary, octal, etc.
  -
  -

Questions that have come up later:
  -
  -
  -

Rules
### Explicit Requirements:
    - Input: Number
    * Can be float or Integer
    - Output: Returned Number
    * Negative version of input, unless input is already negative, or is zero.
    - If number is zero, or negative return the original number
    -
    -

### Implicit Requirements:
    - Negative of a number, same number but precede with minus sign
    +ve of number: 5 --> -ve of number: -5
    -
    -

Examples:

negative(5) == -5
+ve made negative
negative(-3) == -3
with -ve return original number
negative(0) == 0      # There's no such thing as -0 in ruby
with zero return original number

Data Structure:
  - Conditional structure
  - Have to determine whether number is negative
  -

Algorithm
  - Determine whether number is positive
    - If number is positive make negative
  - Return number
  -
  -

=end

def negative(number)
  number > 0 ? number * -1 : number
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby

=begin

# POST-SOLUTION

___First thoughts___
  - I used number * -1, when you can actually just precede the parameter with -
  - LS demonstrates another way of doing this:
    -number.abs
  -
  -

___Mental Model Modifications___
  -
  -

# FURTHER EXPLORATION

a) number > 0 ? -number : number
b) -number.abs

I think b) is superior to a). I can believe I might be wrong, #abs is used to
find the positive of every number, so maybe it's confusing to use it to find
the negative of every number?? I don't know, it seems pretty clear to me.

There aren't multiple conditional doorways to explore, it's just very concise.
That said, maybe you don't know why you would use minus sign + #abs, when you
could just use minus sign.



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