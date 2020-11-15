=begin

Aim:

A triangle is classified as follows:

right One angle of the triangle is a right angle (90 degrees)
acute All 3 angles of the triangle are less than 90 degrees
obtuse One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 180 degrees, and
all angles must be greater than 0: if either of these conditions is not
satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns
a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle
is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating
point errors. You may also assume that the arguments are specified in degrees.

Examples:

triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid

Questions:
  - 
  - 
  - 
  - 

Rules
### EXPLICIT:
    - Input: 3 Integers
    * Each integer represents the degrees of an angle in a triangle
    - Output: Returned Symbol
    * symbol that corresponds with type of triangle ~ acute, right, obtuse, OR
      invalid if the angles don't form a valid triangle

    - Invalid if:
      - Any angle is equal to or less than 0
      - Sum of angles is not 180

    - Acute if:
      - All angles are less than 90

    - Obtuse if:
      - One angle is more than 90

    - Right if:
      - One angle is 90

    - Inputs will always be integers
    - Integers are degrees

### IMPLICIT:
    - 
    - 
    - 

Examples:

triangle(60, 70, 50) == :acute
All angles are less than 90

triangle(30, 90, 60) == :right
There is a 90 angle

triangle(120, 50, 10) == :obtuse
There is a greater than 90 angle

triangle(0, 90, 90) == :invalid
There is a 0 angle

triangle(50, 50, 50) == :invalid
Angles add up to less than 180

Data Structure:
  - We'll need to perform some math operations to determine whether the angles
    make a valid triangle
  - We'll need to determine the length of the longest side, which means we'll
    need to use a data structure based on order - Array
  - 

Algorithm

Input: 3 integers

  1. initialise angles array with `input` elements
  2. Determine whether the angles are invalid
     - Is there a zero angle?
     - Do the angles fail to add up to 180?
  3. Find the largest angle
  4. If the largest angle is greater than 90, return obtuse
  5. If the greatest angle is 90, return Right
  6. Otherwise, return Acute

Output: Symbol

=end

def triangle(angle_a, angle_b, angle_c)
  angles = [angle_a, angle_b, angle_c]

  return :invalid if (angles.include?(0)) || (angles.sum != 180)

  largest = angles.max

  case largest
  when (91..) then :obtuse
  when 90     then :right
  else             :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

=begin

___Lingering Questions___
  1. 
  2. 
  3. 

# POST-SOLUTION

___First thoughts___
  - LS likes to put the invalid return as a clause in the case structure.
    - There case structure isn't about comparing the same case against different
      values. They choose it because the return values for each of the clauses
      are contiguous.
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


