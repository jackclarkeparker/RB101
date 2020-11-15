=begin

Aim:

Write a recursive method that computes the nth Fibonacci number, where nth is
an argument to the method.

Recursive methods have three primary qualities:

They call themselves at least once.
They have a condition that stops the recursion (n == 1 above).
They use the result returned by themselves.

F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2

Questions:
  - What baseline condition will return this recursive call?
    - when the number for the current position is 1?
      - This is already assuming that we're stepping backwards.
  - 
  - 
  - 

Rules
### EXPLICIT:
    - Input: Integer
    * nth Position in Fibonacci Sequence
    - Output: Integer
    * Number at nth position of fibonacci sequence
    - 
    - 
    - 

find_fibonacci_number(1) --> 1
find_fibonacci_number(2) --> 1
find_fibonacci_number(3) --> 2
1 + 1
find_fibonacci_number(4) --> 3
1 + (1 + 1)
find_fibonacci_number(5) --> 5
(1 + 1) + (1 + (1 + 1))
find_fibonacci_number(6) --> 8
((1 + (1 + 1))) + ((1 + 1) + (1 + (1 + 1)))

### IMPLICIT:
    - nth is an Integer
    - Recursive, meaning:
      - It calls itself within itself
      - It uses the result returned by itself
      - It has some baseline condition that undoes all of the recursive calls.
    - 

Examples:


find_fibonacci_number(1) --> 1
find_fibonacci_number(4) --> 3
find_fibonacci_number(5) --> 5
find_fibonacci_number(6) --> 8

Data Structure:
  - 
  - 
  - 

Algorithm
  1. 
  2. 
  3. 
  4. 
  5. 

=end

def fibonacci(n)
  if n > 2
    fibonacci(n-1) + fibonacci(n-2)
  else
    1
  end
end

p fibonacci(1) == 1
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(6) == 8
p fibonacci(12) == 144
p fibonacci(20) == 6765
p fibonacci(40)


=begin

___Lingering Questions___
  1. 
  2. 
  3. 

# POST-SOLUTION

___First thoughts___
  - LS solution uses `return 1 <if modifier>` for baseline check.
  - for position, LS uses nth rather than n
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


