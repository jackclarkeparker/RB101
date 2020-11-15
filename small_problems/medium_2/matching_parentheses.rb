=begin

Aim:

Write a method that takes a string as argument, and returns true if all
parentheses in the string are properly balanced, false otherwise. To be
properly balanced, parentheses must occur in matching '(' and ')' pairs.

Examples:

balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false

Note that balanced pairs must each start with a (, not a ).

Questions:
  - What if there are no parentheses?
  A return true
  - 
  - 
  - 

Rules
### EXPLICIT:
    - Input: String
    * 
    - Output: Boolean
    * true if parentheses in input are properly balanced, false otherwise
    - balanced pairs start with (, not )
    - 
    - 

### IMPLICIT:
    - A balanced pair needs to have an equal number of opening parentheses as
      closing.
      - You can't have a greater number of closing parentheses than opening
        parentheses at any point in the string, assuming you are reading
        left-to-right.
    - Non parentheses characters have no bearing on the result
    - Where there are no parentheses of any kind in the string, return true

Examples:

balanced?('What (is) this?') == true
Happy

balanced?('What is) this?') == false
Unequal number, and starting with closing NU

balanced?('What (is this?') == false
Unequal number

balanced?('((What) (is this))?') == true
Equal number, closing is never greater than opening

balanced?('((What)) (is this))?') == false
Unbalanced (Extra closing)

balanced?('Hey!') == true
No parentheses == true


balanced?(')Hey!(') == false
Closing parentheses first is false

balanced?('What ((is))) up(') == false
At some point in the reading of the string, the number of closing parentheses
is greater than the number of opening parentheses

balanced?('((((()()()))())())') == true
All good up here

Data Structure:
  - We are counting parentheses in a string.
  - Iterating over a string
  - A condition to return true or false based on
  - A counter to determine the number of parentheses at any given point

Algorithm
  1. Initialize a record of parentheses
  2. Iterate over the string
     - adjust parentheses count whenever the current character is a parentheses
     - return false if at any point, the number of closing parentheses is
       greater than the number of opening parentheses.
  3. Return true if the number of opening and closing parentheses are equal

Iterate over the string

Rules
- non parentheses characters are irrelevant
- opening parentheses characters will increment the balance by 1
- closing parentheses characters will decrement the balance by 1

Algorithm
  1. skip the current iteration if the current char is non parentheses
  2. increment balance if the current char is an opening parentheses
  3. decrement balance if the current char is a closing parentheses
  4. return false if the balance goes below 0

=end

def balanced?(string)
  balance = 0

  string.each_char do |char|
    next unless '()'.include?(char)

    if char == '('
      balance += 1
    else
      balance -= 1
    end

    return false if balance < 0
  end

  balance == 0
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('((((()()()))())())') == true

=begin

___Lingering Questions___
  1. 
  2. 
  3. 

# POST-SOLUTION

___First thoughts___
  - Nice way of checking if something is zero is #zero?
  - I had been looking at the iteration block, and wondering about whether I
    needed to exclude non-parentheses characters from the start.
    - I ended up coming to the conclusion that I did need to do this, because
      I didn't want to perform a "return false if balance < 0" after every
      iteration ~ This because it seemed unclear to perform this check when
      working with a non parentheses character. And also concerns that the
      program would be slowed down by running this expression every iteration.
      - There is no concern for speed here, we're not dealing with humungous
        methods. This is the equivalent of an atomic fraction of chump change.
      - Insofar as readability, it may be true that a 'return false if' condition
        is quite specific to try and catch out an extra closing parentheses,
        and having so specific a condition may confuse readers when they are
        simply passing an irrelevant character into the current block.
        - Point is, I could have looked more carefully at how to ensure that
          the block would return false when the balance sunk below 0.
          - Don't need a specific return false expression here, can instead opt
            for the LS tactic ~ break from the iteration if balance is less than
            0, rather than return false, and then the check against 0 on the final
            line will catch out the extra closing parentheses. Very smooth,
            to utilise this comparison for both situations.
  - 
  - 

___Mental Model Modifications___
  - Nice way of checking if something is zero is #zero?
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