require 'pry'

a = 1
b = 2
binding.pry
c = 3

# referencing c in the pry call won't return an error. It recognizes the variable
# but returns nil. This is a demonstration of hoisting behaviour.