=begin

# First Try (Pre Documentation check)

I know reject is similar to delete_if and reject!, just that it's a
non-destructive version of these methods. It will return a new array which will
containing all elements of the receiver that don't return a truthy value to the
block.
The distinction between delete_if and reject! is what they return if no values
have truthy return values. delete_if returns the original array and reject!
returns nil. (I think) But also, perhaps is there a bit of a rule where methods
that end with a bang return nil if they don't change anything??? So maybe this
won't be consistent with #reject

So I guess it will return [1, 2, 3] because none of the return values are truthy

# Post Documentation

# Post Solution

GOT ITTTTTTTttttt

The same code written with reject! Does return nil, because there is no difference
to the original code

=end