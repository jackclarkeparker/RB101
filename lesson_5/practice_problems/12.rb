arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
hash_conversion = {}

arr.each do |pair|
  hash_conversion[pair[0]] = pair[1]
end

p arr
p hash_conversion