=begin

Aim:
Write a method that takes a positive integer, n, as an argument, and displays a
right triangle whose sides each have n stars. The hypotenuse of the triangle
(the diagonal side in the images below) should have one end at the lower-left
of the triangle, and the other end at the upper-right.

  - input: Integer
  - output: Display String
  Rules
    - Input
      - Integer n
    - Output
      - Right Angle Triangle
        - made from n outputted strings
        - n length sides
        - Hypotenuse bot_left -> top_right
        - consists of asterisks
        - solid
    -

Examples:

triangle(5)

    *
   **
  ***
 ****
*****
triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

Algorithm
  - Initialize template_string
    - empty space equal to n
  - Intialize edge_index
    - index of the last character in the string
    - loop
      - decrement edge_index
      - print the template which is reassigned with an asterisk at edge_index
      - break when edge_index is 0

=end

puts "top left"
def top_left_triangle(size)
  template_string = '*' * size
  edge_index = size

  until edge_index == 0
    puts template_string
    edge_index -= 1
    template_string[edge_index] = ' '
  end
end

top_left_triangle(9)
top_left_triangle(5)

puts "top right"
def top_right_triangle(size)
  template_string = '*' * size
  edge_index = 0

  until edge_index == size
    puts template_string
    template_string[edge_index] = ' '
    edge_index += 1
  end
end

top_right_triangle(9)
top_right_triangle(5)

puts "bot left"
def bot_left_triangle(size)
  template_string = ' ' * size
  edge_index = 0

  until edge_index == size
    template_string[edge_index] = '*'
    puts template_string
    edge_index += 1
  end
end

bot_left_triangle(9)
bot_left_triangle(5)

puts "bot right"
def bot_right_triangle(size)
  template_string = ' ' * size
  edge_index = size

  until edge_index == 0
    edge_index -= 1
    template_string[edge_index] = '*'
    puts template_string
  end
end

bot_right_triangle(9)
bot_right_triangle(5)

=begin

# Post-Solution

Lots of solutions (including Launch Schools) involved adding spaces and *, and
incrementing/decrementing each. It's kind of a really simple path to take. Why?
Because it uses the base components visible to us. It adds spaces and stars.
More intelligble, easier to work with. Doesn't rely on some abstract background
moving parts.

I also saw a solution that used rjust and ljust, which was pretty nice.

When I looked to see how some people had interpreted the Further Exploration, I
recognized something that I'd already considered, but hadn't carried out - to
build a single method that can draw any of the triangles. Well, I saw one
person had done two solutions, one for regular triangles and one for upside
down triangles.