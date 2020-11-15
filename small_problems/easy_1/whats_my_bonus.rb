# Pre-Solution

def calculate_bonus(salary, boolean)
  if boolean
    bonus = salary / 2
  else
    bonus = 0
  end
end

puts calculate_bonus(2800, true)
puts calculate_bonus(1000, false)
puts calculate_bonus(50000, true)
puts calculate_bonus(50005, true)

# Post-Solution
# No need to assign the variable bonus here, and given that this is a basic
# conditional structure with two outcomes dependent on a boolean, it is
# suitable for a ternary conditional statement.