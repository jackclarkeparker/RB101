flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << 'Dino' << 'Hoppy'

=begin

  Post-Solution

This question is about appending multiple elements to an array at once.

I just used the shovel operator twice, I know that you can chain it.

In the provided solution, it is revealed that Array#concat will append the
elements of an argument array to the receiver array. These elements will be
added without also adding a nested array - each element will simply be appended
to the original array.

While looking at the documentation for Array#push, I noticed that it also has
the ability to add more than one element to the array at a time. Where #concat
specializes in adding the elements from one array into another, #push instead
allows us to add multiple arguments outside of an array into the receiving 
array. If one of the provided arguments is an array, this will become nested
within the receiver.

All of these methods are destructive, and will return the calling array and so,
can be chained together.

=end