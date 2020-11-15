=begin

Write a method that takes an Array of Integers between 0 and 19, and returns an
Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven,
twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

Aim:
  - input: array
  - output: array
  Rules
    - Input Array
      - Integers, between 0 and 19
        - Doesn't have to be every number
        - Could be double ups?

    - Output Array
    - Integers, sorted
      - sorted alphabetically by english word for integer

Examples:

alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

Algorithm
  - Intialize Constants
    - NUMBERWORDS
      - Conversion hash between Integer and Corresponding Word
  - Sort input Hash
    - Sort alphabetically by NUMBERWORD string for integer
  -
  -
  -

=end

NUMBERWORDS = %w(zero one two three four five six seven eight nine ten eleven
                 twelve thirteen fourteen fifteen sixteen seventeen eighteen
                 nineteen)

def alphabetic_number_sort(integer_array)
  integer_array.sort { |a, b| NUMBERWORDS[a] <=> NUMBERWORDS[b] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
p alphabetic_number_sort((0..3).to_a) == [1, 3, 2, 0]
p alphabetic_number_sort([2, 6, 4, 1, 5, 4, 3, 5, 6, 3, 5]) == [
  5, 5, 5, 4, 4, 1, 6, 6, 3, 3, 2
]

=begin

# POST-SOLUTION

The solution uses Array#sort_by instead of Array#sort, which is a little bit
simpler than Array#sort.

The questions asks to consider why the solution uses Enumerable#sort_by,
instead of Array#sort_by!
  - As an aside, the convention that says that a bang operator indicates a
    destructive method, which has a non_destructive form without the bang holds
    true for #sort_by!, but it may be of note that the non-destructive form is
    an Enumerable method, not an Array method. We can see that these mutating/
    non-mutating pairs are not constrained to a class, in this case one of them
    is available in the mixin module.
    Perhaps of note, Hash has no sort_by! method. Perhaps this is because order
    in Hashes is not meant to be of much significance.

I guess the reason that they use the Enumerable method is that they don't want
to mutate the original array object in case it's order is of significance
elsewhere.