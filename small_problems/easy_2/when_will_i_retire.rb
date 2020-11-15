# Pre-solution

# print "What is your age? "
# age = gets.to_i

# puts "Go back to school!" if age < 15

# print "At what age would you like to retire? "
# retire_at = gets.to_i

# years_left = retire_at - age

# if years_left < 0
#   puts "It's 2020. You'd have liked to retire in #{2020 + years_left}."
#   puts "You've worked #{years_left.abs} years of overtime!"
# else
#   puts "It's 2020. You will retire in #{2020 + years_left}."
#   puts "You have only #{years_left} years of work to go!"
# end

# Post-Solution
# The solution uses the Time class to create a Time object for the current year
# this will update the current year to whenever the program is run.
# The solution also opts to assign a variable name to all of the interpolated
# values, which I guess makes the code easier to read. Here is the solution,
# having updated with learning from the solution.

print "What is your age? "
age = gets.to_i
puts "Go back to school!" if age < 15

print "At what age would you like to retire? "
retire_at = gets.to_i

current_year = Time.now.year
years_left = retire_at - age
retirement_year = current_year + years_left

if years_left < 0
  puts "It's #{current_year}. You'd have liked to retire in"\
  "#{retirement_year}."
  puts "You've worked #{years_left.abs} years of overtime!"
else
  puts "It's #{current_year}. You will retire in #{retirement_year}."
  puts "You have only #{years_left} years of work to go!"
end