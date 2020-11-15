=begin

Aim:
Write a method that takes an Array, and returns a new Array with the elements
of the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method
you wrote in the previous exercise.

  - input: Array
  - output: Array
  Rules
    - Input Array
      - any type, any length
    - Output Array
      - elements of the original list in reverse order
        - same elements like same objects?
      - NOT the same array object passed in.
    - Original Array object un modified.

Examples:

reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]

list.object_id != new_list.object_id  # => true
Different objects

list == [1, 3, 2]                     # => true
Original object unchanged

new_list == [2, 3, 1]                 # => true
New Array has elements in reverse order

Algorithm
  - initialize new array
  - iterate through original array
    - unshift new array with each element
  - return the new array.
  -

=end

def reverse(array)
  new_array = []
  array.each { |ele| new_array.unshift(ele) }
  new_array
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

=begin

# FURTHER EXPLORATION

Try using each_with_object and inject

=end

def reverse(array)
  array.each_with_object([]) { |element, object| object.unshift(element) }
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

p "INJECT"
def reverse(array)
  array.inject([], :unshift)
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true
