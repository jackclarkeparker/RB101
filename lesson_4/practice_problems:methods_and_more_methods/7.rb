=begin

# First Try (Pre Documentation check)

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

The return value of the block in the above code will vary between true and
false, depending on the iteration. The first iteration will return true.

It is determined by whether the current element from the array is odd or not.

The return value of the Enumerable#any? call will be [1, 3], while the output
will be:
1
2
3

# Post Documentation

# Post Solution

Woops! I got the #any? call confused with something else. I guess I thought of
it as a #select call. #any? will stop iterating through the array once it can
guarantee it's return value, this is sort of like short-circuit behaviour.

This means that the output will only be 1, because after the first iteration,
the #any? call will have determined that there are values in the collection
that return true, and this is it's only goal.

It's return value will be a boolean. In this case true.


=end