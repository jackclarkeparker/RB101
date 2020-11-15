require 'pry'

def double_num(num)
  num * 2
end

arr = [1, 2, 3].map do |num|
  double_num(num)
  binding.pry
end

p arr

# If we put a binding.pry call in the bottom of a method definition may effect
# the output of the program: binding.pry returns nil, this nil may be used by a
# method if it is at the bottom of it's definition.