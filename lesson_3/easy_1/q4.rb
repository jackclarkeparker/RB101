numbers = [1, 2, 3 ,4, 5]

# Array#delete_at will delete the element in the array which is at the specified index
numbers.delete_at(1)
# => 2
p numbers == [1, 3, 4, 5]

numbers = [1, 2, 3 ,4, 5]

# Array#delete will delete any elements in the array that match the provided argument
numbers.delete(1)
# => 1
p numbers == [2, 3, 4, 5]
