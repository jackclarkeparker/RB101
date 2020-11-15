# PRE-SOLUTION

def integer?(number)
  number.to_i.to_s == number
end

def float?(number)
  number.to_f.to_s == number
end

def string_to_number(number)
  if integer?(number)
    number.to_i
  elsif float?(number)
    number.to_f
  elsif number.is_a? Integer
    number
  end
end

def square(arg)
  arg = string_to_number(arg)

  if arg
    arg**2
  else
    puts "Sorry, need a numeric argument to square"
  end
end

puts square(5) == 25
puts square(-8) == 64

# POST-SOLUTION
# Waa I just saw what they meant about using the multiply method now that I've
# seen the solution. I think I kind of tunnelled in on the way that I saw I
# could solve it. It's truly as simple as:
# def square(n)
#   multiply(n, n)
# end