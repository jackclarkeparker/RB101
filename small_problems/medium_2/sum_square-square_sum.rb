=begin

Aim:

Write a method that computes the difference between the square of the sum of
the first n positive integers and the sum of the squares of the first n
positive integers.

Questions:
  - 
  - 
  - 
  - 

Rules
### EXPLICIT:
    - Input: Integer
    * First n positive integers
    - Output: Integer
    * The difference between the square of the sum of first n integers and the
      sum of the squares of the first n integers
    - 
    - 
    - 

sum_square_difference(3)
-> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)

### IMPLICIT:
    - The difference means a - b, where a is square of sum and b is sum of squares
    - 
    - 

Examples:

sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)

sum_square_difference(10) == 2640

sum_square_difference(1) == 0
(1) ** 2 - (1**2)

sum_square_difference(100) == 25164150
As input gets bigger, output grows

Data Structure:
  - Need to find the difference of two numbers
    - The numbers themselves are built from the same list of integers
      - Array, used twice
  - 

Algorithm

Input: Integer

  1. Initialize integers as an array of numbers from 1 upto input
  2. Set square_sum to the sum of integers to the power of two
     - Add all numbers in integers together
     - Square the sum
  3. Set sum_square to the sum of square of each number in integers
     - Find square of each number in integers
     - Sum the squares
  4. Subtract sum_square from square_sum
  5. 

Output: Integer

=end

def sum_square_difference(n)
  integers = 1..n
  square_sum = integers.sum**2
  sum_square = integers.map { |num| num**2 }.sum
  square_sum - sum_square
end



p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

=begin

___Lingering Questions___
  1. 
  2. 
  3. 

# POST-SOLUTION

___First thoughts___
  - LS implemented a solution that involved incrementing a sum and sum_of_squares
    variable with each element from the range (/the element to the power of two)
  - sum_of_squares and square_of_sums is a little more clearer than sum_square
    and square_sum.

  - Woah, I wasn't sure whether 1.upto(n) without calling .to_a would work. It
    generated an enumerator in the end, and still worked :s, also still works as 1..n

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


