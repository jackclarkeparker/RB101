=begin

Aim:

Write a method that determines the mean (average) of the three scores passed to
it, and returns the letter value associated with that grade.

Numerical|Score|Letter |Grade
90 <= score <= 100  'A'
80 <= score < 90  'B'
70 <= score < 80  'C'
60 <= score < 70  'D'
0 <= score < 60 'F'

Tested values are all between 0 and 100. There is no need to check for negative
values or values greater than 100.

Questions:
  - Are the input values always integers?
    - Can they be floats?
    - Can they be numeric strings?
    A~They won't be strings
  - What does "the mean" mean in this context?
    - Sum of values, divided by number of values?
    A~Yes
    - Should the average be found as a float for accuracy, or is it better to
      use integer division to find the average?
    A~It doesn't matter.

Questions that have come up later:
  -
  -
  -

Rules
### EXPLICIT:
    - Input: 3 Integers
    * Three Scores
    - Output: String
    * Single character string - the grade associated with the mean of the three
    scores
    - Inputs is within (0..100)
    -
    -

## THIS is the scoring table
Numerical|Score|Letter |Grade
90 <= score <= 100  'A'
80 <= score < 90  'B'
70 <= score < 80  'C'
60 <= score < 70  'D'
0 <= score < 60 'F'

### IMPLICIT:
    - Input scores are always integers
    - Output string is a single uppercase letter
    -

Examples:

get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

Data Structure:
  - We're trying to find the average of three numbers
  - We then want to check this against a grading chart to determine the grade.
  - How do we build this chart?
    - The chart is a combination of ranges associated with strings
      - What is each range?
      - If we're working with integers, then it's pretty simple, but that's not
        very accurate.
    - So maybe, rather than a hash, a conditional structure?
      - case statement
  -
  -

Numerical|Score|Letter |Grade
90 <= score <= 100  'A'
80 <= score < 90  'B'
70 <= score < 80  'C'
60 <= score < 70  'D'
0 <= score < 60 'F'

Algorithm
  - Find mean of three values
    - Sum, then find float result of dividing by three
  - Pass mean into grading conditional structure
    - Determine grade based on this first digit of the mean
  - Return the result of the grading conditional
  -
  -

=end

def get_grade(score1, score2, score3)
  average = (score1 + score2 + score3) / 3

  return 'A' if average == 100

  first_digit = average.to_s[0]
  case first_digit
  when '9' then 'A'
  when '8' then 'B'
  when '7' then 'C'
  when '6' then 'D'
  else          'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

=begin

# POST-SOLUTION

___First thoughts___
  - score1, score2, score3 are not important variables that will be used elsewhere
    s1, s2, s3 are fine for them.
  - I was a little derailed by the thought that it was important to find a float
    for the average. I later came to the conclusion that it didn't matter whether
    the numbers were floats or not. Had I not been caring about floats, then I
    might have used ranges for my conditions.
  - I didn't know you could insert a range as a condition in a case statement,
    and it would automatically check to see whether the case value within that
    range.
        KUDOS - I built the average the same
              - I also used a case statement to find the grade in my solution.

___Mental Model Modifications___
  - I didn't know you could insert a range as a condition in a case statement,
    and that it would automatically check to see whether the case value was
    within that range.
  - score1, score2, score3 are not important variables that will be used elsewhere
    s1, s2, s3 are fine for them.
    - Then again, it's not a great idea to give variables names that are too short
      as they will be more likely to crop up accidentally in blocks, which may
      cause some unintended variable shadowing confuzzling.

# FURTHER EXPLORATION

Aim: 

How would you handle this if there was a possibility of extra credit grades
causing it to exceed 100 points?

Questions:
  - What does 'extra credit grades' mean in this context?
    - Grades higher than 'A', or scores higher than 100?
      - If there a stronger grades than 'A', I would find out what range of
        scores they would require, and then build these ranges into new clauses
        in my case statement.
      - If we're just trying to handle a value that's above 100, I would set no
        upper limit on the range for 'A', it would just be (90..)
  -
  -
  -

  Rules
    - Input
    - Output
    -
    -
    -

Examples:

Algorithm
  -
  -
  -
  -
  -

=end


