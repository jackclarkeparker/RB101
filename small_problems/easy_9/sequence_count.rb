=begin

Aim:

Create a method that takes two integers as arguments. The first argument is a
count, and the second is the first number of a sequence that your method will
create. The method should return an Array that contains the same number of
elements as the count argument, while the values of each element will be
multiples of the starting number.

You may assume that the count argument will always have a value of 0 or
greater, while the starting number can be any integer value. If the count is 0,
an empty list should be returned.

Questions:
  - Are the multiples in the sequence in any particular order?
    - Ascending for positive sequence, descending for negative?
  - Will input always be integers?
    - Could it be string numeric?
      - If so, should the sequence be of string numbers, or integers?
  -
  -

Questions that have come up later:
  -
  -
  -

Rules
### EXPLICIT:
    - Input: Two integers
    * First integer is a count
    * Second integer is the first number in a sequence
    (count, fundamental)
    - Output: New Returned Array
    * Size of array is equal to the count input
    * Array consists of sequence of multiples of second integer
    -
    -
    -

### IMPLICIT:
    - Sequence of numbers is:
      - ascending in increments of multiple where first num is +ve
      * 5, 1 --> [1, 2, 3, 4, 5]
      - descending in decrements of multiple where first num is -ve
      * 4, -7 --> [-7, -14, -21, -28]
      - Staying at zero, where first num is zero
      * 3, 0 --> [0, 0, 0]
      - Empty array where count is zero
      * 0, 1000000 --> []

Examples:

sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

Data Structure:
  - We need to construct an array, this is what is returned.
  - Sequence of numbers, ascending / descending multiples
  -

Algorithm
1 - Initialize sequence as an empty array
2 - Initialize current_number with a value of 0
3 - add fundamental to the current_number
4 - push current_number to the sequence array
5 - repeat steps 3-4 count number of times
6 - return the sequence array

=end

def sequence(count, multiple)
  sequence = []
  current_number = 0

  count.times do
    current_number += multiple
    sequence << current_number
  end

  sequence
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

=begin

# POST-SOLUTION

___First thoughts___
  - I was wondering about whether I should rename my `multiple` variable. I'm
    happy with 'multiple', but let's go ahead and write our thoughts down before
    checking the solution next time!
  - I had been wondering about calling the collection `sequence`, when that's
    the name of the method as well, wasn't sure whether this was something you
    should avoid. Never fear! LS also called their collection `sequence`.
  - I wasn't sure whether it was a good idea to assign my current_number variable
    to 0 first, or whether it would be better to straight away assign it to my
    `multiple` parameter. I decided to go with 0, and then to increment by
    `multiple` each time because this made sense to me. However, I perhaps didn't
    explore what implementation would look like if I assigned multiple straight
    away. On reflection, a good strategy may involve keeping options open, and
    exploring additional avenues of how problems can be solved, rather than
    condensing around one possible implementation.
    - An argument for initializing the variable with an assignment to `multiple`
      is that we'll have to do give it the value of multiple again before using
      the variable anyway. By assigning it to 0, we're left wondering, why is
      it 0? Why isn't it `multiple`? We're repeating ourselves.
      - It's clearer to assign the variable to what it will be used as.
        Otherwise, the assignment that it is given ends up being a red herring.
      - Another point, rather than `current_number`, a better name is
        `current_multiple`.

  - LS presents another interesting solution, using the return value of map
    iterating over a range, and multiplying the current value by the `multiple`
    variable to find each element in the sequence.
    - I guess something to consider when the return value for a method is an
      array, there may well be some smooth tight solution possible to discover
      through the use of `map`.

___Mental Model Modifications___
  -
  -

# FURTHER EXPLORATION

Aim:

Questions:
  -
  -
  -
  -

  Rules
    - Input
    - Output
    -
    -
    -

Examples:

Algorithm
  -
  -
  -
  -
  -

=end


