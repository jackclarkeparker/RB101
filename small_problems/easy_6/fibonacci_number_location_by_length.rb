=begin

Aim: The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...)
such that the first 2 numbers are 1 by definition, and each subsequent number is
the sum of the two previous numbers. This series appears throughout the natural
world.

Computationally, the Fibonacci series is a very simple series, but the results
grow at an incredibly rapid rate. For example, the 100th Fibonacci number is
354,224,848,179,261,915,075 -- that's enormous, especially considering that it
takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci
number that has the number of digits specified as an argument.
(The first Fibonacci number has index 1.)

You may assume that the argument is always greater than or equal to 2.

- input:(integer)
- output:(Integer)
Rules
  - Input Integer
    - Digits in a fib number
  - Output Integer
    - Index of first appearance of Fib No. with Input Digits
    - (First Fib number has index 1.)
  - Fibonacci sequence ~
    - first two numbers are defined as 1
    - subsequent numbers are found by sum of last two numbers.

  Need to be able to generate Fib numbers until condition.
    find_fibonacci_index_by_length


Examples:

find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

Algorithm
  - initialize fibonnacci array with first two num
  - while the last element is smaller in length than the input
    - find and push the next element to fibonacci
  - return the last element of fibonacci
  -
  -

=begin
# PRE-SOLUTION

I was thinking about the problem breaking it down PEDAC etc. I thought, need a
method that can loop through finding subsequent Fibonacci numbers until
condition is met. Then I thought, this method, what is it going to return?
find_fibonacci_number sounds like it will return the number, but we need the
index. And we don't want a method that returns the number for no reason, and
additionally returns the index.. Right?? So instead, I thought. Hmmm. I could
call it find_fibonacci_index

Just feels a bit too abstract. Lost in the construct. Then I look down, and
they have named it find_fibonacci_index_by_length. AHhhh. They just made it
longer. Don't worry about giving methods names that are too long. Make them
descriptive. Easy to read and understand is more important than speed at which
you can type.
=end

=end

def find_fibonacci_index_by_length(required_length)
  fibonacci_sequence = [1, 1]

  until fibonacci_sequence.last.digits.count == required_length
    fibonacci_sequence << fibonacci_sequence[-2, 2].sum
  end

  fibonacci_sequence.size
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
# p find_fibonacci_index_by_length(100000) == 478495

# It keeps going towards 47! The number 47 with relation to magnitudinal
# increases in digit length... What does it mMENAEAAAANN????

=begin

# POST-SOLUTION

One note that is made in the solution is that the break condition from the loop
is checked the digit length is >= rather than == the required_length. This
sounded in my mind as well. The point they make is that it's unlikely to cause
an issue in this application, but writing the conditional in this way saves us
from an infinite loop in case the number of digits in the sequence skips over
our required length and never is equal to it.
