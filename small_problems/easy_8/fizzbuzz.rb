=begin

Aim:

Write a method that takes two arguments: the first is the starting number, and
the second is the ending number. Print out all numbers between the two numbers,
except if a number is divisible by 3, print "Fizz", if a number is divisible by
5, print "Buzz", and finally if a number is divisible by 3 and 5, print
"FizzBuzz".

Questions:
  - input
    - Can floats be included?
    No
    - Can number arguments be supplied as strings?
    No
  - How should each of the numbers / strings be printed?
    - Print on the same line?
    Yes
      - Space delimited?
      - Comma delimited?
      Comma and Space delimited
    - Print on separate lines?
    No

  - When printing a string, such as "Fizz", should the quotes be included in
    what is displayed?
    No
  - Can integers be negative?
  Yes
  - Can the sequence be descending instead of ascending?
  Yes
  - Do we include the supplied numbers in the sequence that is printed?
  Yes


  Rules
    - Input - Two Integers
    - Output - Printed Output
      - print all numbers between the provided arguments, inclusive,
        with the exception of:
        - numbers that are divisible by 3, substitute "Fizz"
        - numbers that are divisible by 5, substitute "Buzz"
        - numbers that are divisible by both 3 and 5, substitute "FizzBuzz"
      - Output printed on a single line
    - Number divisible by n means number % n == 0
    -

Example:

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

Algorithm
  - Initialize array with range n1..n2
  - Transform array
    - numbers that are divisible by 3, substitute "Fizz"
    - numbers that are divisible by 5, substitute "Buzz"
    - numbers that are divisible by both 3 and 5, substitute "FizzBuzz"
    - otherwise, leave number as is
  - Print all array values, delimiting elements with ", ".
    - Final number in the sequence doesn't have a trailing ", ".
  -
  -

=end

# def fizzbuzz(n1, n2)
#   sequence = (n1..n2).to_a
  
#   sequence.map! do |num|
#     if num % 15 == 0
#       "FizzBuzz"
#     elsif num % 5 == 0
#       "Buzz"
#     elsif num % 3 == 0
#       "Fizz"
#     else
#       num
#     end
#   end
  
#   sequence.each_with_index do |element, index|
#     print element
#     unless index == sequence.size - 1
#       print ", "  
#     else
#       print "\n"
#     end
#   end
# end

# fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

def fizzbuzz(n1, n2)
  array = (n1..n2).to_a
  array.map! { |num| value_for_sequence(num) }
  print_sequence(array)
end

def value_for_sequence(number)
  if number % 15 == 0
    "FizzBuzz"
  elsif number % 5 == 0
    "Buzz"
  elsif number % 3 == 0
    "Fizz"
  else
    number
  end
end

def print_sequence(sequence)
  sequence.each_with_index do |element, index|
    print element
    print index < sequence.size - 1 ? ", " : "\n"
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

=begin

# POST-SOLUTION

___First Thoughts___

Well, one thing that I notice straight away, the easy way of delimiting the
elements of the sequence with ', ' is by using #join(', ').

I also represented the logic of "divisible by both 3 and 5" as divisible by 15,
which is not the same thing. In this case they will result in the same outcome,
but if the conditions for substituting with "Fizz"/"Buzz" were different, say
"divisible by both 6 and 8" then divisible by 48 would miss some numbers.

Mainly though, it's just not a clear representation of the logic. If the
condition for an outcome is that it is divisible by both 3 and 5, then it's
clearest to literally write this in the code, not some derivation of this fact.

___Modification to Mental Models___

I had wondered about how I could represent the conditional in value_for_sequence
differently. I'd even wondered about using a case statement, but thinking through
it, I realised that I couldn't call modulo on the keyword when, and so reasoned
there was no advantage to case. This would simply be a more longwinded way of
posing the conditional compared to an if statement, right? Extra characters /
not making use of syntactic sugar means that there's no reason to use case here,
right?

Well the LS solution did use case, and I can now perhaps see an argument for it.

It's not about how long it takes to write something out, it's all about how easy
it is to read. The benefit that a case statement has in this situation is
semantic.

Conditional if is a nice, general, everyman sort of a conditional, it's
about controlling the flow of execution. Compared to case statements, if is more
about walking our code through a hallway with different doors to walk through,
and different logic to execute depending on a variety of conditions.

Case on the other hand is well suited to a conditional situation where the outcome
there are a number of different clauses, but the logic that applies for each is
relatively simple, or contiguous with the other clauses. In this case, we are
simply reassigning data to a literal value depending on if it meets the condition.

In this clean, shallow conditional, a case statement is easy to digest, even if
the total LOC required to construct it is more than an if statement, it's easy
on the eyes, and that's one of the more important things to strive for in your
code.