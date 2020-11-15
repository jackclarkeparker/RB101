=begin

Aim: Write a method that takes an Array as an argument, and returns two Arrays
(as a pair of nested Arrays) that contain the first half and second half of the
original Array, respectively. If the original array contains an odd number of
elements, the middle element should be placed in the first half Array.

  - input: Array
  - output: 2d Array
  Rules
    - Input Array
    - Output Array
      - contains two nested arrays
        - first contains first half of elements
        - second contains second half of elements
        - Where there are an odd number of elements, the center element is
          assigned to the first nested array.

Examples:

halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
Happy Path

halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
Odd sized array ~ first nested arr gains extra el

halvsies([5]) == [[5], []]
Single element ~ still two nested arrays, first is one ele, second is empty

halvsies([]) == [[], []]
empty input ~ two nested empty arrays

Algorithm
  - initialize array with two nested empty arrays
  - Assign first nested array with input slice!
  - replace second array with input

  instantiate first_array_index and second_array_index
  - while 
  -
  -

How do I initialize some nested arrays to push to?
Could initialize the return array with nested elements.

How to find index to start pushing elements from for each arr?
first is 0
second is (arr.size / 2.0).round

What about when index reference nil values?


size 4 rindex 2
size 5 rindex 3
size 6 rindex 3
size 7 rindex 4
size 8 rindex 4
size 9 rindex 5
size 10 rindex 5

=end

def halvsies(array)
  nested_arrays = [[], []]
  nested_arrays[0] = array.slice!(0, (array.size / 2.0).round)
  nested_arrays[1].replace(array)
  nested_arrays
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

=begin

# Post_solution

I was close! I was fully expecting they'd have some brilliant method that would
do this all in one fell swoop, nice and easy. I felt sure they'd use some
totally different implementation, but it actually looks pretty similar! :)
Happy Jack! :)


Couple things, Float#ceil, and Float#floor are more explicit than Float#round.
When you always want to round things towards infinity / negative infinity,
these are preferential.

For this case, we can say that Floor#ceil is more descriptive than Floor#round.


Another thing, I found the index of the element at which to slice the array
using the same logic that they did, but they were perhaps more explicit than I
was by assigning it to a variable called middle, and then slicing up to middle.
This explains what the logic is, which can otherwise look a bit arcane.


They could have done destructive slicing, but I suppose if you slice something
destructively it's good if it's done for a purpose. It's kind of like a
signpost - LOOK HERE, WE ARE CHANGING THIS DATA. In this case I used #slice! as
a means of accessing #replace for the second half of the variable. If the only
reason I am modifying the array is to give me access to a different retrieval
method, when there's no good reason to not use the same retrieval method, then
this code is confusing.


Another implementation decision that was made here was to assign the subarrays
to elements, and only provide them in a nested structure at the step where they
are returned:
[first_array, second_array]

I like this ^^ because we're going to need to return the array at the end of
the method anyway, so rather than repeat ourselves, we can get rid of the
unnecessary array initialization at the start of the method, and bundle it all
together in this final step.

