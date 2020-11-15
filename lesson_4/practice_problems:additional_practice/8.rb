=begin

## What happens when we modify an array while we are iterating over it?

The array can be modified mid iteration which can cause some unexpected side
effects with how the iteration will be carried out - with the collection
modified, the way in which the iteration will interpret things like the index
can be changed.

## What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

1
3
=> [2, 4]
### Woops!, I got confused with the shift call on the second iteration. The
first value in the array during the second iteration is 2, this is shifted.
The return value ends up being [3, 4]

## What would be output by this code?


numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

1
2
[1, 2]

=end