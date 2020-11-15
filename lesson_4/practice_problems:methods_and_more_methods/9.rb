=begin

# First Try (Pre Documentation check)

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

What is the return value of map in the above code?
['ant', 'bear']

Why?
When we call #map on an enumerable, it returns an array whose elements are the
return value of each iteration through the block. In this case, the return
value of each iteration is the value of each k/v pair.

# Post Documentation

# Post Solution

Doh. I saw the condition read > 3 and assumed that this would allow 'ant' to
pass through. Human error. The first iteration has a return value of `nil`
because the condition isn't met, and there is no other code in the block,
leading to a return value of nil.

LITERALLY if none of the conditions in an if statement evaluate to true, the if
statement itself returns nil.

=end