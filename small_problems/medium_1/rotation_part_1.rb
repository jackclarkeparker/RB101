=begin

Aim:

Write a method that rotates an array by moving the first element to the end of
the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

Questions:
  - What if array is empty?
  A~return a new empty array
  - Single element array?
  A~return a new array with same element in same position
  -
  -

Questions that have come up later:
  -
  -
  -

Rules
### EXPLICIT:
    - Input: Array
    - Output: Array
    * New array - contains the elements of the original array rotated
    - Can't use prebuilt #rotate method.
    -
    -

['a', 'b', 'c'] --> ['b', 'c', 'a']
indexes: 'a' - 0
         'b' - 1
         'c' - 2
-v-v-v-v-v-v-v-v-
         'a' - -1
         'b' - 0
         'c' - 1


### IMPLICIT:
    -
    -
    -

Examples:

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

Data Structure:
  - We're returning a new array here, perhaps map will be useful?
  - We want to be able to access the index of each element.

Algorithm
  - Initialize rotated_array as a copy of the input array
  - iterate through the input array
    - Assign the current element to rotated_array at the current_element's index - 1
  -return the rotated_array

=end

def rotate_array(array)
  rotated_array = array.dup

  array.each do |element|
    rotated_index = array.index(element) - 1
    rotated_array[rotated_index] = element
  end

  rotated_array
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

=begin

# POST-SOLUTION

___First thoughts___
  - LS used a real simple solution, they just sliced the elements at indices
    (1..-1), and added the element at index 0
              - :O
  -
  -
  -

___Mental Model Modifications___
  -
  -

# FURTHER EXPLORATION

Aim:

Write a method that rotates a string instead of an array. Do the same thing for
integers. You may use rotate_array from inside your new method.

Questions:
  - Am I rotating each character of the string, or each word?
  A~I'll say character
    - If the rotation leads to trailing or leading whitespace, should this be
      removed from the returned string?
    A~I'll say no
  -
  -
  -

  Rules
    - Input string
    - Output new string
    -
    -
    -

Examples:

'word' --> 'ordw'

Algorithm
  - split string into array of characters
  - rotate the array of characters
  - join the array back together
  -
  -

=end

def rotate_array(array)
  rotated_array = array.dup

  array.each do |element|
    rotated_index = array.index(element) - 1
    rotated_array[rotated_index] = element
  end

  rotated_array
end

def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_integer(integer)
  rotate_array(integer.digits.reverse).join.to_i
end

p rotate_string('word') == 'ordw'
p rotate_integer(123) == 231
