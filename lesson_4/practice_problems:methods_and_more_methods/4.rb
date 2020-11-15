=begin

# First Try (Pre Documentation check)

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

This code will return a hash where they each key is the first letter of an
element from the receiver array, and each value is the same element in full:

{ 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }

# Post Documentation

# Post Solution

=end
