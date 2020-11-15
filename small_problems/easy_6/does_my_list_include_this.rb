=begin

Aim:
Write a method named include? that takes an Array and a search value as
arguments. This method should return true if the search value is in the array,
false if it is not. You may not use the Array#include? method in your solution.

  - input: Array, Search Value
  - output: Boolean Object
  Rules
    - Input
      - Array
      - Search Value
    - Output
      Boolean
        - true if Search Value in Array.
        - false if Search Value not in Array.
    - Can't use #include?

Examples

include?([1,2,3,4,5], 3) == true
Happy Path

include?([1,2,3,4,5], 6) == false
Happy Path

include?([], 3) == false
Empty arrays can't have any elements, not even empty strings - an empty string
is an element. Still a happy path

include?([nil], nil) == true
nil is a value that can be included in the array, and can be searched for

include?([], nil) == false
An empty array doesn't have a nil value, Happy path

Algorithm
  - Iterate through the array
    - check to see whether any of the elements are equal to the search value.
  -
  -
  -

=end

def include?(array, search_value)
  array.any? { |element| element == search_value }
end

p 1
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

def include?(array, search_value)
  !!array.find_index(search_value)
end

p 2
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

def include?(array, search_value)
  array.each { |element| return true if element == search_value }
  false
end

p 3
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

=begin

# FURTHER EXPLORATION

The further exploration asked for you to come up with additional ways of
solving the problem. At first, I couldn't be bothered, but then when I decided
to try, I didn't come up with anything while sitting with it for five minutes,
so I decided to look and see what other people had done.

As a side note, I can see the utility in having the ability to come up with
multiple solutions - I sense that flexibility in implementation can allow you
to come up with more ways of solving a problem, and diversity of options will
lead to better solutions in many cases.

I've seen one pretty simple one that used Array#count, simply as
array.count(search_value) > 0

I've seen a number that used Array#any? like mine.
One person made the point that you don't even need to supply a block, and can
simply pass in the argument, similar to include?

One person made the point that while we weren't supposed to use include? there
was no mention of Enumerable#member? which is very similar.

I've seen some that #select instead of #any? with the same block that I used,
before calling empty? on the array assigned by #select. Or another variant that
called size on the array, and compared to see if the size was greater than 0

Another interesting one involved using reduce with it's memo argument, it
started with a false value, and evaluated a ternary conditional statement with
each iteration, returning true if any element was equal to the search term,
or returning the same memo's current value if not.

Let's build them :)

=end

def include?(array, search_value)
  array.count(search_value) > 0
end

p 4
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

def include?(array, search_value)
  array.any?(search_value)
end

p 5
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

def include?(array, search_value)
  array.member?(search_value)
end

p 6
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

def include?(array, search_value)
  container = array.select do |element|
    element == search_value
  end
  !container.empty?
end

p 7
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

def include?(array, search_value)
  array.select { |element| element == search_value }.size > 0
end

p 8
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

def include?(array, search_value)
  array.reduce(false) do |accumulator, element|
    element == search_value ? true : accumulator
  end
end

p 9
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
