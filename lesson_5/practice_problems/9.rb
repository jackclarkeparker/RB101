arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
p arr

p (arr.map do |array|
  array.sort do |a, b|
    b <=> a
  end
end)

# They called it sub_arr, it's good practice to refer to inner arrays as subarrays.