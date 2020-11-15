=begin

Aim:

In this exercise, you are going to compute a method that returns the last digit
of the nth Fibonacci number.

Questions:
  - Is there a correlation between the last digit of the nth number and n itself?
  - 
  - 
  - 

Rules
### EXPLICIT:
    - Input: 
    * 
    - Output: 
    * 
    - 
    - 
    - 

### IMPLICIT:
    - Our solution needs to handle a nine digit input
    - 
    - 

The examples do seem to be suggesting something:
  - The 100th number has 21 digits
  - The 100_001th number has 20899 digits
  - The 1_000_007th number has 208989 digits

Magnitudinal increases to n by 10 seem to increase the number of digits of nth
number also tenfold.

Maybe to find the last digit, we don't need to calculate the whole number.
Only numbers of the smallest significance will impact the value of this digit.

Will this be any faster?

1, 1, 2, 3, 5, 8, 3, 1, 4, 5, 9, 4, 3, 7, 0, 7, 7, 4, 1, 5, 6, 1, 7, 8, 5, 3, 8, 1, 9, 0, 9, 9, 8, 7, 5, 2, 7, 9, 

Examples:

fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4

Data Structure:
  - Array multiple assignment
  - variables being reassigned
  - 

Algorithm
  1. Assign two variables to a tuple of 1 and 1
  2. Reassign the variables to new values simultaneously:
     - the first variable is reassigned to the second,
     - the second is reassigned to the first plus the second
       - Divide this by 10 if the result is greater than 10

  3. Repeat 2 n times
  4. return the second variable
  5. 

=end

# def fibonacci_last(n)
#   sequence = [1, 1]
#   3.upto(n) do
#     new_term = sequence[-2] + sequence[-1]
#     sequence << new_term
#   end
#   sequence[-1].to_s[-1].to_i
# end

require 'pry'

def fibonacci_last(n)
  first, last = [1, 1]
  3.upto(n) do
    first, last = [last, first + last]
    last %= 10 if last >= 10
  end
  last
end

# 1, 1, 2, 3, 5, 8, 3, 1, 4, 5, 9, 4, 3, 7, 0, 7

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4

=begin

___Lingering Questions___
  1. 
  2. 
  3. 

# POST-SOLUTION

___First thoughts___
  - LS uses this same idea of reducing the number down with modulo. I wasn't
    sure whether doing this would be enough to free up the computing power of
    the computer. Afterall the same number of loops, right? Well it turns out,
    computing large numbers takes longer than single digit ones :)

  - LS did arrange their answer slightly differently, they set it up as a single
    array, called `last_2`. Each iteration through the upto block would reassign
    the array to [a.last, (a.first + a.last) % 10]
      - I didn't recognize that modulo can be called every time. I wonder if this
        is faster?
        - Hehe, mine is faster. I wonder whether it's faster to call if first?
          - Doesn't matter!
        - It doesn't actually matter. At this stage, we're really only thinking
          about readability.
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