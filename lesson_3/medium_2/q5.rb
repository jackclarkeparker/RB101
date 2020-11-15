def reassign_string_modify_array(string, array)
  string += "rutabaga"
  array << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
reassign_string_modify_array(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
