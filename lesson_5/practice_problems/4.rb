arr1 = [1, [2, 3], 4]
puts "Before: #{arr1}"
arr1[1][1] = 4
puts "After: #{arr1}\n\n"

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
puts "Before: #{arr2}"
arr2[2] = 4
puts "After: #{arr2}\n\n"

hsh1 = {first: [1, 2, [3]]}
puts "Before: #{hsh1}"
hsh1[:first][2][0] = 4
puts "After: #{hsh1}\n\n"

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
puts "Before: #{hsh2}"
hsh2[['a']][:a][2] = 4
puts "After: #{hsh2}\n\n"
