=begin

I'm guessing #count will return a number representing how many elements
in the collection return true from the block they are passed into.

Another way of writing it would be array.select { block }.size

We can find out from this code by running it, or more specifically by invoking
p on it. I'm not totally clear on whether you can call p on a multiline block
directly. I assume you can if you call it at the start of the first line.
  - Another way would be to assign the block to a variable, and invoke p on this

Also can find out by reading the documentation.

To answer the question specifically, count will increment a number that starts
as 0 by 1 every time that it encounters an iteration with a truthy return value

=end