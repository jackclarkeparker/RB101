=begin

Aim:

Write a method that takes an Array as an argument, and reverses its elements in
place; that is, mutate the Array passed into this method. The return value
should be the same Array object.

You may not use Array#reverse or Array#reverse!.

  - input: Array
  - output: Array
  Rules
    - Input Array
      - array of inconsequential objects
      - Can be strings, can be Integers, can be single element, or empty.
    - Returned Array
      - Reversed order of elements
      - Same Array object.
        - Doesn't have to be same same element objects.

Examples:

list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"]
list == ["c", "d", "e", "b", "a"]

list = ['abc']
reverse!(list) == ["abc"]
list == ["abc"]

list = []
reverse!(list) == []
list == []

Algorithm
  - initialize holding_array
  - transform input Array
    - populate holding_array with shifted input array elements
  - transform holding_array
    - populate input array with popped holding array elements
  - return input array.
  -

=end

def reverse!(list)
  holding_array = []

  until list.empty?
    holding_array << list.shift
  end

  until holding_array.empty?
    list << holding_array.pop
  end

  list
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

list = []
p reverse!(list) == []
p list == []

=begin
# Just a glance

I noticed that the solution used multiple assignment and an index for the
left most element and right_most elements of the array. I'll try and build
something like that before looking again.

[1, 2, 3, 4]

Algorithm
  - initialize indexes for the leftmost and rightmost elements in the array
    - 0, one less than size
      - for #first/#last they allow you to select initial iteration of outside
        elements, but there is no option for incrementing index
  - loop
    - swap leftside and rightside elements using multiple assignment
    - break when the difference between indexes is <= 1
    - increment indexes
      - left positively
      - right negatively
  -

=end

def reverse!(list)
  return list if list.empty?

  left_index = 0
  right_index = list.size - 1
  
  loop do
    list[left_index], list[right_index] = list[right_index], list[left_index]
    break if right_index - left_index <= 1
    left_index += 1
    right_index -= 1
  end

  list
end

=begin

I had wondered how to handle an empty array. The solution puts the condition
for the loop at the start - it's a while loop. They also assign the right index
with [-1] I'm not sure why I didn't do this.

The condition for the loop is as follows:
=end

while left_index < list.size / 2

=begin

When I saw this, I thought, Gosh! The left index starts as zero. I thought
dividing by zero resulted in a ZeroDivisionError! Well, it turns out here,
we're not dividing BY zero, but we're dividing Zero by something else. This
results in 0. 

For an empty array, the condition will read -
while zero is less than zero
and will not proceed any further.
The same will occur with a single element array. list.size<1> / 2 gives 0
No operations take place, which is exactly what we want in a single element
array.

I'd like to break down this condition with bigger numbers too, it seems a
useful formula for accessing half of an array.

When the list size is odd e.g. 5 the bar will be set at ~ as long as the index
is less than 2. This will return true for the first two iterations - 0 is less
than 2, and 1 is less than 2. Once the index has incremented to 2, we'll exit
the loop structure. Having had a chance to interact with all elements but the
center element.

When the list size is even e.g. 6 the bar will be set at ~ as long as the index
is less than 3. This will return true for the first three iterations - 0 is
less than 3, 1 is less than 3, and 2 is less than 3. By the time the index has
incremented to 3, we'll have had a chance to interact with all elements in the
array.

So this conditional formula allows us to interact with all but the centre
elements of an array. It's an interesting candidate for multiple assignment.