=begin

Aim:

Bubble Sort is one of the simplest sorting algorithms available. It isn't an
efficient algorithm, but it's a great exercise for student developers. In this
exercise, you will write a method that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array.
On each pass, each pair of consecutive elements is compared. If the first of
the two elements is greater than the second, then the two elements are swapped.
This process is repeated until a complete pass is made without performing any
swaps; at that point, the Array is completely sorted.

Write a method that takes an Array as an argument, and sorts that Array using
the bubble sort algorithm as just described. Note that your sort will be
"in-place"; that is, you will mutate the Array passed as an argument.
You may assume that the Array contains at least 2 elements.

Questions:
  - After a swap is made, is the pass reset to the beginning of the collection?
  A No
  - If a swap is made, will the next comparison compare with the original element,
    or the swapped element? In other words, does the swap take place after a
    complete pass, or does the swap take place at the moment of the comparison?
  A Swap takes place at the moment of comparison
  - Will the elements of the array always be of the same type?
  A At this stage, yes.
  - What if two elements have the same value?
  A Don't swap

Rules
### EXPLICIT:
    - Input: Array
    * array of at least 2 elements
    - Output: Array
    * Same array object that was passed in

    - Make multiple "passes" (iterations) through the array
      - A pass involves comparing all consecutive elements of array
        - Where first element is greater than second, a swap is made
          - When the swapping condition is met, the swap takes place immediately
            following comparison.
      - Passes must always be made in their entirety, from start to finish.
      - Passes continue to be made until a pass is made without performing any
        swaps.

### IMPLICIT:
    - Sorted array is smallest ---> biggest
    - 
    - 

Examples:

array = [5, 3]
bubble_sort!(array)
array == [3, 5]
Smallest to biggest

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]
Sorted Integers

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
Sorted Strings


Data Structure:
  - We're working with an array.
  - We're iterating over the array and modifying it as we're going.
    - Don't want to modify a method while iterating over it.
    - Loop

Algorithm

Input: Array

Two loops?
  One for beginning a pass until no swaps are made in the prior pass
  One for iterating over the array

  1. Begin loop
  2. Set:
     - pre_pass_array to a duplicate of the input
     - index to 0
  3. Begin inner loop
  4. Compare element of input at `index` and at `index + 1`
     - Where element at `index` is greater, swap elements
  5. increment index by 1
  6. break from the loop if the index is equal to the size of the array - 1
  7. end the inner loop
  8. break from the outer loop if the pre_pass_array is equal to the input
  9. end the outer loop
  10. return input

Output: Same Array, sorted

=end

def bubble_sort!(input)
  loop do
    pre_pass_array = input.dup

    swap_iteration!(input)

    break if input == pre_pass_array
  end
  input
end

def swap_iteration!(array)
  index = 0

  loop do
    if array[index] > array[index + 1]
      array[index], array[index + 1] = array[index + 1], array[index]
    end
    index += 1
    break if index + 1 == array.size
  end

  array
end




array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

=begin

___Lingering Questions___
  1. Better name for the method that performs a swap iteration
  2. ((Maybe a different way of swapping elements instead of parallel assignment?))
      - NOT really. Apparently this is "the usual idiom for swapping two values."
  3. 

# POST-SOLUTION

___First thoughts___
  - They used a swapped variable like a switch, which was my first thought
  - They had their method return nil!! It didn't need to return nil. It didn't
    need to have an output of the same array swapped necessarily either!
    Because the array is modified, the return value should be insignificant though........
  - 
  - 

___Mental Model Modifications___
  - 
  - 

# FURTHER EXPLORATION

Aim:

Note that we did not use the optimization suggested on the Wiki page that skips
looking at tail elements that we know are already sorted. If your solution also
skipped this optimization, try modifying your solution so it uses that
optimization.

- After the first iteration, the largest element will have already made it to
  it's final position, and no longer needs to be compared in future passes.
  - Beyond this, any elements following the final swap are also not in need of
    being checked for comparison again.
    - with each iteration, the biggest element from the remaining elements to
      be sorted will find it's place. If it isn't bigger than any of the
      elements to it's right (and doesn't swap with them) then none of the
      remaining elements will need a swap with these right-most elements either.

Questions:
  - 
  - 
  - 
  - 

  Rules
    - Input: 
    * 
    - Output: 
    * 
    - 
    - 
    - 

Examples:



Algorithm
  1. 
  2. 
  3. 
  4. 
  5. 

=end


