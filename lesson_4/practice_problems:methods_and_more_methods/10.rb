=begin

# First Try (Pre Documentation check)

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

What is the return value of the above code?
[1, nil, nil]

Why?
Map always returns an array consisting of the return value of the block. The
first element doesn't meet the if condition and so instead the code evaluates
the else clause, which simply invokes 1, and returns this same value.
The other two iterations both meet the first condition, and result in a puts
statement. For these iterations, the puts statement is the last expression of
the block, and it's return value of `nil` is passed to the returned array from
map.

# Post Documentation

# Post Solution

=end