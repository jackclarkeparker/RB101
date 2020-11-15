=begin

The return value of the Array#select method in this example will be a new array
consisting of all of the elements in the receiver. (not the same objects, just
the same values)

Array#select returns a new array, leaving the original one unchanged. It passes
in values into the returned array as long as they have a truthy return value
when passed into the block. The block in the example features a string for it's
last evaluated expression, and strings are truthy, because they are neither nil
nor false, so it doesn't matter what element is passed into this method, it will
be included in the of the method as a whole.

=end