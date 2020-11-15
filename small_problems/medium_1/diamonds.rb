=begin

Aim:

Write a method that displays a 4-pointed diamond in an n x n grid, where n is
an odd integer that is supplied as an argument to the method. You may assume
that the argument will always be an odd integer.

Questions:
  - Should I include whitespace on the far side of the diamond, to make up total
    n * n grid?
  - Do I need to print this as a single string, or can I use multiple separate
    strings?
  -
  -

Rules
### EXPLICIT:
    - Input: odd integer (n)
    * Always odd
    - Output: printed 4-pointed diamond
    * on an n * n grid, made of '*'
    -
    -
    -

### IMPLICIT:
    - Distance from one corner to it's opposite is n
    -
    -

Pattern of output number of stars:

1    *
3   ***
5  *****
n *******
5  *****
3   ***
1    *

First line is ((n / 2) - 0) white space + (* + (0 * '**'))
Second line is ((n / 2) - 1) whitespace + (* + (1 * '**'))
Third line is ((n / 2) - 2) whitespace + (* + (2 * '**'))
Fourth line is ((n / 2) - 3) whitespace + (* + (3 * '**'))

add two each line as approaching the centre
centre is n # of stars
remove two each line as leaving the centre

Examples:

diamond(1)

*
With an n of 1, we just print a single diamond

diamond(3)

 *
***
 *

diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

Data Structure:
  - We're either adding a bunch of strings together and printing them in one go,
    or we're printing each line, one by one.
  - The sequence of *'s and ' ' is determined by a conditional and a loop
  -

First line is ((n / 2) - 0) white space + (* + (0 * '**'))

Algorithm
  1. assign modifier to 0
  2. Print a string consisting of ((n/2) - modifier) whitespace and (1 + (modifier * 1) asterisks
  3. Increment modifier
  4. Repeat #2 and #3 until printing a sequence of n asterisks and no whitespace
  5. Print a string consisting of ((n/2) - modifier) whitespace and (1 + (modifier * 1) asterisks
  6. Decrement modifier
  7. Repeat steps #5 and #6 until modifier is negative

Algorithm
  1. assign modifier to 0
  2. Print a string consisting of ((n/2) - modifier) whitespace and (1 + (modifier * 1) asterisks
  3. Increment modifier
  4. Repeat #2 and #3 (n/2) times
  5. Print a string of n diamonds
  6  Print a string consisting of ((n/2) - modifier) whitespace and (1 + (modifier * 1) asterisks
  7. Decrement modifier
  8. Repeat #6 and #7 (n/2) times

=end

def diamond(n)
  display_upper_semi_diamond(n)
  puts '*' * n
  display_lower_semi_diamond(n)
end

def display_upper_semi_diamond(n)
  (n / 2).times do |modifier|
    whitespace = ' ' * ((n / 2) - modifier) 
    stars = '*' * (1 + (modifier * 2))

    puts whitespace + stars
    modifier += 1
  end
end

def display_lower_semi_diamond(n)
  modifier = (n / 2)

  (n / 2).times do
    modifier -= 1
    whitespace = ' ' * ((n / 2) - modifier) 
    stars = '*' * (1 + (modifier * 2))

    puts whitespace + stars
  end
end

diamond(1)

#*

diamond(3)

#  *
# ***
#  *

diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

=begin

___Lingering Questions___
  1. How can I do this more tidily? Dude. It's fine. It takes experience and
     time to learn to do things idiomatically. If you feel your code is cringy,
     good! This means that you've found an uncomfortable limit to your ability,
     this is a good place to work at.
  2.
  3.

# POST-SOLUTION

___First thoughts___
  - Oooh they used centre for whitespace! Padstr! FTW, ofcccc
  - They also recognized the modifier variable that was consistent for both whitespace and asterisks.
    - Actually no they didn't. They used centre with n to generate whitespace
  - They did the upper semi diamond lower semi diamond too :)
    - They say that the problem becomes manageable when you see this.
  -

___Mental Model Modifications___
  - Use center, or rjust/ljust when printing strings with whitespace padding.
  - #upto and #downto are good iterators that you want to use when you have a
    value that is incrementing or decrementing with each iteration.

# FURTHER EXPLORATION

Aim:

Try modifying your solution or our solution so it prints only the outline of
the diamond:

diamond(5)

  *
 * *
*   *
 * *
  *

Questions:
  -
  -
  -
  -

  Rules
    - Input: Positive odd integer
    - Output: Printed diamond outline
    * Must be hollowed on the inside with whitespace
    - diamond is of n height and width
    - is printed on an n * n grid
    -
    -

Output consist of whitespace + * at tips, and
whitespace + * whitespace + * along sides, and
* + whitespace + * at center

Examples:

diamond(1)

*

diamond(3)

 *
* *
 *

diamond(5)

  *
 * *        1 away from left index, distance is 1
*   *       3 away from left index, distance is 0
 * *
  *

diamond(9)

    *            0 away from left index, distance is 4
   * *           1 away from left index, distance is 3
  *   *          3 away from left index, distance is 2
 *     *         5 away from left index, distance is 1
*       *        7 away from left index, distance is 0
 *     *         5 away from left index, distance is 1
  *   *          3 away from left index, distance is 2
   * *           1 away from left index, distance is 3
    *            0 away from left index, distance is 4

Data Structure

- I could find a way of building the substring in the center?
  - It's just whitespace, with a left and right '*'
join them with "\n\n"

size / 2 + 1 times
  - use indexed assignment
  - increment right_outline, decrement left_outline

until left and right index are equal
  - use indexed assignment

Algorithm
  - Construct array of strings (rows) with whitespace equal to grid_size
  - Assign left_outline and right_outline to (n / 2) + 1
  - iterate over the array of strings, inputting stars at left_outline and
    right_outline.

    How can distance give left/right outlines?
      - Distance gives the starting position for the left_outline. How can we
        work out the right_outline from this?


e.g. distance starts at

=end

def display_upper_semi_diamond(n)
  left_outline = n / 2
  right_outline = left_outline

  (n / 2).times do
    row = ' ' * n
    row[left_outline] = '*'
    row[right_outline] = '*'

    puts row
    left_outline -= 1
    right_outline += 1
  end
end

def display_lower_semi_diamond(n)
  left_outline = 0
  right_outline = n - 1

  ((n / 2) + 1).times do
    row = ' ' * n
    row[left_outline] = '*'
    row[right_outline] = '*'

    puts row
    left_outline += 1
    right_outline -= 1
  end
end

def diamond_outline(size)
  display_upper_semi_diamond(size)
  display_lower_semi_diamond(size)
end

diamond_outline(5)

diamond_outline(9)