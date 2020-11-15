=begin

Write a method that will take a short line of text, and print it within a box.

You may assume that the input will always fit in your terminal window.

Aim:
  - input: String
  - output: Printed string output
  Rules
    - Input String
      - Short line of text
      - Will fit in terminal window
    - Printed Output String
      - enclosed string inside box 5Hx(4 + String.length)W
        - Shouldn't go on multiple lines, because text always fits in terminal window.
      - 5 strings for five lines
      - box components
        - | sides
        - - floor and ceiling
        - + corners
        - whitespace empty space
    - Empty string input - box with 5Hx4W dimensions

Example:

print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
print_in_box('')
+--+
|  |
|  |
|  |
+--+

Algorithm
  - print top line
  - print second line
  - print third line
  - print fourth line
  - print fifth line

=end

def print_in_box(string)
  puts '+-' + ('-' * string.length) + '-+'
  puts '| ' + (' ' * string.length) + ' |'
  puts '| ' + string + ' |'
  puts '| ' + (' ' * string.length) + ' |'
  puts '+-' + ('-' * string.length) + '-+'
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')

# POST-SOLUTION
# The LS solution was DRY clever, it generalized the string pattern for edges
# and for filler. I'll use this in the further exploration 2.

# FURTHER EXPLORATION 1 - Truncate

def print_in_box(string)
  string = string[0..75] if string.length > 76

  puts '+-' + ('-' * string.length) + '-+'
  puts '| ' + (' ' * string.length) + ' |'
  puts '| ' + string + ' |'
  puts '| ' + (' ' * string.length) + ' |'
  puts '+-' + ('-' * string.length) + '-+'
end

print_in_box("I tell ya, Rodney Dangerfield, that's a funny guy, let's "\
             "commemorate that sun of a gun until the bludy cows come home.")

# FURTHER EXPLORATION 2 - Wrap
=begin
While the string is longer than 76 characters,
  - find box_fill_length
  - determine whether the character at index 76 is white space
    - if so, slice!(0..75) the string
      - strip, center, and print
    - if not, reverse search (from the end of the string) for whitespace, and upon finding it
      assign box_fill_length
      slice!0..the index before the whitespace.
      - strip the slice and center it.

strip and center any leftover text.

NOTE

=end

def box_edge(string, width = string.length)
  puts '+' + ('-' * (width + 2)) + '+'
end

def box_filler(string, width = string.length)
  puts '|' + (' ' * (width + 2)) + '|'
end

def box_string(string, width = string.length)
  puts "| " + string.center(width) + " |"
end

def small_box(string)
  box_edge(string)
  box_filler(string)
  box_string(string)
  box_filler(string)
  box_edge(string)
end

def print_in_box(text)
  return small_box(text) if text.length < 77

  string_width = text.rindex(' ', 76)

  box_edge('', string_width)
  box_filler('', string_width)

  while text.length > 76
    substring = text.slice!(0...(text.rindex(' ', string_width + 1)))
    substring = substring.strip.center(string_width)
    box_string(substring)
  end

  box_string(text.strip.center(string_width))
  box_filler('', string_width)
  box_edge('', string_width)
end

print_in_box("I tell ya, Rodney Dangerfield, that's a funny guy, let's "\
             "commemorate that sun of a gun until the bludy cows come home.")

print_in_box("And so the story goes, they wore the clothes, they said the "\
             "things to make it seem improbable. Whale of a lie like they "\
             "hope it was. And the good men, tomorrow, had their feet in, "\
             "the wallow, and their heads of brawn were nicer shorn and how "\
             "they bought their positions with saccharine and trust. And the "\
             "world was asleep, to our latent fuss. Sighing they swirl "\
             "through the streets like the crust of the sun, the Bewlay "\
             "Brothers.")

print_in_box("zippity doo da")

