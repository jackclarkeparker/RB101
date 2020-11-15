puts "What is the bill?"
bill = gets.to_f

puts "What is the tip percentage?"
tip_pc = gets.to_f * 0.01

tip = (bill * tip_pc).round(1)

puts "The tip is $#{tip}"
puts "The total is $#{tip + bill}"

# Post-Solution
# 'percentage' is a good variable name, tip_pc is a little more unclear.
# Also, solution finds percentage by dividing by 100 rather than multiplying by
# 0.01, which is also a bit more clear.
# TOtally missed, that the solution uses 'print' on the first two strings, not
# 'puts' which means that no newline is included in the prompt strings, and
# user input is collected on the same line.