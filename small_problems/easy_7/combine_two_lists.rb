=begin

Aim:
Write a method that combines two Arrays passed in as arguments, and returns a
new Array that contains all elements from both Array arguments, with the
elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the
same number of elements.

  - input: Two Arrays
  - output: Array
  Rules
    - Input
      - Two Arrays
      - non-empty
      - same number of elements
    - Output
      - New Array
      - populated by all elements of input Arrays
        - Alternating:
          - Element 1 in A1, 1 in A2 -> 2 in A1, 2 in A2

Examples

interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

Algorithm
  - Initialize New Array
  - instantiate index 0
  - until index + 1 is the size of Array 1
    - push element at index from A1 to New Array
    - same for A2
    - increment index
  - return New Array

=end

def interleave(array1, array2)
  interleaved_array = []
  index = 0

  until index == array1.size
    interleaved_array.append(array1[index], array2[index])
    index += 1
  end

  interleaved_array
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

=begin

# POST-SOLUTION

Given that we're iterating over an array accessing each element, and using the
index, is there an Array method that comes to mind?

#each_with_index  ??

The solution uses this, the element block variable accesses the element from
array1, then the index is used to access with the element in array2 with
element reference.

Method also uses two shovel operators. Which is easier to read?

interleaved_array << element << array2[index]
interleaved_array.append(element, array2[index])
interleaved_array.push(element, array2[index])

I like append the least.

I think double shovel is pretty nice.

They don't worry about calling the variable result.

I think interleaved_array is a fine variable name.

I had been wondering about what the best way of refactoring my code was.
I guess that almost every exercise I do has some clever way of making something
more readable. In this I could have inspected. What is my iterator doing? Is
there a good method that encapsulates that? Even if I'm not sure whether it
makes my code clearer, at this stage, I want to experiment. Try things out.
Start small and simple, get the exercise completed this way, and then look to
refactor afterwards.

# FURTHER EXPLORATION

=end

def interleave(array1, array2)
  array1.zip(array2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
