=begin

Aim:

Fortunately, every recursive method can be rewritten as a non-recursive
(procedural) method.

Rewrite your recursive fibonacci method so that it computes its results without
recursion.

Questions:
  - What does it mean to write a method non-recursively, or as a procedural
    method?
    1. It won't call itself.
  - 
  - 
  - 

Rules
### EXPLICIT:
    - Input: Integer
    * position in the fibonacci sequence
    - Output: Integer
    * number at input position of fibonacci sequence
    - Fibonacci sequence follows these rules:
      - First two numbers in the sequence are both 1
      - f(n) = f(n-1) + f(n-2)

1, 1, 2, 3, 5, 8, 13

We've got to build this sequence without recursion.

### IMPLICIT:
    - 
    - 
    - 

Examples:

fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501
Non-recursive works a whole lot better than recursive??

Data Structure:
  - We're constructing a sequence of numbers by adding existing numbers of the
    sequence together.
  - Array element structure
  - 

Algorithm
  1. Initialize sequence as a tuple with two elements carrying a value of 1.
  2. Grow sequence until it is of a length equal to the input
     a) Initialize new_term as the sum of the last two values of sequence
     b) append new_term to sequence
     c) repeat steps a), and b) until the sequence contains <input> elements
  3. return the final element of sequence
  4. 
  5. 

=end

require 'pry'

def fibonacci(n)
  sequence = [1, 1]
  3.upto(n) do
    new_term = sequence[-2] + sequence[-1]
    sequence << new_term
  end
  sequence[-1]
end

p fibonacci(20)# == 6765
p fibonacci(100)# == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501

=begin

___Lingering Questions___
  1. 
  2. 
  3. 

# POST-SOLUTION

___First thoughts___
  - They don't build an array! They just reassign a first and last variable
    with parallel assignment.
  - They're still using the same Integer#upto iterative structure to perform
    the correct number of operations to find the nth number of the sequence.
  - 
  - 

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


