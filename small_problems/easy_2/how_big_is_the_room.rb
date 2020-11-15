# Pre-Solution

puts "Enter the length of the room in metres:"
length = gets.chomp.to_f
puts "Enter the width of the room in metres:"
width = gets.chomp.to_f
area_in_m = (length * width).round(2)
area_in_f = (length * width * 10.7639).round(2)
puts "The area of the room is #{area_in_m} square metres (#{area_in_f} square" \
" feet)."

# Post-Solution
# You don't need to include chomp, because the carriage return characters are
# not picked up in the conversion to a float, which only searches the string
# for numbers and converts these.