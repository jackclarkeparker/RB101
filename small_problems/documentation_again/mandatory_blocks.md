```ruby
a = [1, 4, 8, 11, 15, 19]

a.bsearch { |x| x > 8 }
```

The bsearch method makes use of a logarithmic algorithm which is a much faster
way of searching for values in sorted lists than linear search functions like
Enum#find. 

When a logarithmic search function iterates over a sorted array looking for a match, the first element passed into it's block will be that in the center of the array. The return value of the block with this element will determine that either the elements on the left or right of this initial element do not need to be examined, cutting the the data set to search through in half. The operation will then be repeated with the remaining range of elements that must still be searched through, and so on until the desired element is located.

When performing searches on big lists of data this cuts the number of operations down by a significant amount compared linear search algorithms. Linear search algorithms work by checking each value of a list sequentially, without gathering further information about where might be better to look.

-----

The bsearch algortihm has two modes - findmin, and findany

The findmin mode will be utilized when the block supplied to bsearch returns a boolean value. findmin performs a search for the smallest value for which it's block returns true. 
1. If the block returns `false`, the search continues by selecting the centermost element from the set of elements to the right of the initial element.
2. If the block returns `true` the search continues in the same way but with elements to the left.
NOTE -- if the element being searched for is left of centre, and the centre element returns false, then the method will return `nil` :
As stated above, a `false` return value leads the algorithm to continue it's search with the set of elements to the right of the initial element. This will lead the algorithm further astray from the desired element, only returning more `false` return values, which ultimately end up evaluating the method to `nil`.

If the return value of the block is a number, then findany is used.
The findany logic resembles the logic of the spaceship operator `<=>`

1. Where the number is positive, the algorithm will perform it's next check on the set elements to it's left.
2. Where the number is negative, the search will continue on the elements to the right.
3. Where 0 is returned, the method has found it's desired element and will return this element to the original flow of execution.