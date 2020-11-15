def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
puts "(String will be 'pumpkins'), (Array will be ['pumpkins', 'rutabaga'])"
# The string is reassigned in the method, the array is mutated. Reassignment
# gives the a_string_param parameter a new object to point to, it has no
# effect on the original object.