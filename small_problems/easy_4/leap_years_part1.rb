def leap_year?(year)
  if year % 400 == 0
    true
  elsif (year % 4 == 0) && (year % 100 != 0)
    true
  else
    false
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

# Post-Solution

# I often forget that boolean operators actually return booleans, and that
# these can be used as the return value for a method.

# The solution offers two methods. One is a similar but simpler version of mine
# that doesn't use &&, instead returning false on the year % 100 == 00 condition,
# and returning the evaluation of year % 4 == 0 in the else clause - this returns
# true or false automatically.

# The second solution is more compact. It relies on the return value of boolean
# operators for it's return value, never explicitly evaluating a boolean object
# for return. It isn't a conditional, but a logical ||/&& cluster that addresses
# all of the conditions from my solution on a single line of code.