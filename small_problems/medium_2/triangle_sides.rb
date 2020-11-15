=begin

Aim:

A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides must
be greater than the length of the longest side, and all sides must have
lengths greater than 0: if either of these conditions is not satisfied, the
triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as
arguments, and returns a symbol :equilateral, :isosceles, :scalene, or
:invalid depending on whether the triangle is equilateral, isosceles,
scalene, or invalid.

Examples:

triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid

Questions:
  - Can triangles have a negative length?
  A No, all sides must be greater than 0
  - Will the input ever be provided as a different type, i.e. numeric string?
  A No
  - Do I need to handle a shape that has more sides than what are suggested?
  A No
  - Three integers provided as separate args, or in a data structure?
  A Separate args

Rules
### EXPLICIT:
    - Input: 3 integers
    * 3 lengths of sides of a triangle
    - Output: symbol
    * represents which type of triangle will be made with the three inputs, or
      if they are invalid.
    - Types of triangles:
      - Equilateral ~ all sides are equal
      - Isosceles ~ Two sides are equal
      - Scalene ~ All sides are unequal
    - Rules for valid triangle:
      - Sum of two smaller sides is greater than longest side
      - All sides are greater than 0
    - 
    - 

### IMPLICIT:
    - 
    - 
    - 

Examples:

triangle(3, 3, 3) == :equilateral
all equal sides

triangle(3, 3, 1.5) == :isosceles
2 equal sides

triangle(3, 4, 5) == :scalene
all unique sides

triangle(0, 3, 3) == :invalid
a side is of length 0 ~ invalid

triangle(3, 1, 1) == :invalid
The sum of smallest two sides is less than the longest side ~ invalid

Data Structure:

  - I'll need to sort the numbers from highest to lowest
    - This to find two shortest sides
      - This to determine whether the sum of two shortest sides > longest side
    - Sorting uses order ~ Array

  I'll also be performing some mathematical operations so will use integers
  / floats for those.

Algorithm

Input: 3 integers

  1. initialise sides array with sides within
  2. sort the sides
  3. return invalid if there are any sides of length 0
  4. return invalid if the sum of two shortest sides is less than the longest
  5. Find the number of sides that are the same length
     - If there are three sides of same length, return equilateral
     - If there are two sides of same length, return isosceles
     - If there are no sides of same length, return scalene

### Find number of sides of same length
Initialise element_count as an empty hash

Iterate through collection
  - Increment the current



Output: Symbol

=end

def triangle(a, b, c)
  sides = [a, b, c]
  sides.sort!

  return :invalid if (sides.include?(0)) || (sides[0] + sides[1] < sides[2])

  number_of_equal_sides = sides.tally.values.max

  case number_of_equal_sides
  when 3 then :equilateral
  when 2 then :isosceles
  else        :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

=begin

___Lingering Questions___
  1. 
  2. 
  3. 

# POST-SOLUTION

___First thoughts___
  - I started out thinking I would go for side_a, side_b etc. then decided,
    maybe I don't need to be so verbose, and a, b, c will be fine?
    - If I were to go back through the code and read it line by line again, I
      might decide to label the sides accordingly because I only reference them
      thusly at the very start of the method. It's good to know what variable
      is what.
      - More importantly, you can't always know what you will call a variable
        or method when you first are defining it. Therefore it's important to
        come back and revise the names you give to your variables/methods.
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


