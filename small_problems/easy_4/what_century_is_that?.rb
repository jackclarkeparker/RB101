def which_century?(year)
  year_string = year.to_s

  if year % 100 == 0
    century_number = year_string[0..-3]
  else
    century_number = (year_string[0..-3].to_i + 1).to_s
  end
end

def which_suffix?(century_number)
  if century_number.end_with?("1") && !century_number.end_with?('11')
    'st'
  elsif century_number.end_with?("2") && !century_number.end_with?('12')
    'nd'
  elsif century_number.end_with?("3") && !century_number.end_with?('13')
    'rd'
  else
    'th'
  end
end

def century(year)
  if year < 0
    bce = true
    year = year * -1
  end

  century_number = which_century?(year)
  century_suffix = which_suffix?(century_number)

  if bce
    century_number + century_suffix + " Century BCE"
  else
    century_number + century_suffix + " Century"
  end
end

p century(2000) == '20th Century'
p century(2001) == '21st Century'
p century(1965) == '20th Century'
p century(256) == '3rd Century'
p century(5) == '1st Century'
p century(10103) == '102nd Century'
p century(1052) == '11th Century'
p century(1127) == '12th Century'
p century(11201) == '113th Century'
p century(-11345) == '114th Century BCE'

# Post-Solution

# For a while with this one I was wondering how to go about removing the last
# two digits of an integer, somehow, dividing by 100 didn't occur to me!
# I also hadn't thought of using century % 100 as a means of accessing those
# digits.

# I thought through a couple different ways of returning the correct suffix,
# though only fleshed out one. It's pretty awkward code. I'd wondered about
# returning 'th' first for 11 12 and 13, but it seemed like more steps, and
# more heavy handed. I also was keen to try out my logic cause it seemed like
# it wasn't too many steps, and that I'd actually found a way of presenting the
# logic tidily. Using (century % 100) is pretty neat though. And then the case
# statement for the last_digit.