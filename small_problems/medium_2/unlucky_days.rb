=begin

Aim:

Write a method that returns the number of Friday the 13ths in the year given by
an argument. You may assume that the year is greater than 1752 (when the United
Kingdom adopted the modern Gregorian Calendar) and that it will remain in use
for the foreseeable future.

friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2

Questions:
  - Will the year always come as an integer argument?
  A Yes
  - Is the 13th the same day everywhere in the world?
  A Yes, I'm pretty sure it is. 99%
  - 
  - 

Rules
### EXPLICIT:
    - Input: Integer
    * Year after 1752
    - Output: Integer
    * Number of Friday the 13s in the input year
    - Uses dates as recognized by the modern Gregorian Calendar
    - 
    - 
    - 

### IMPLICIT:
    - Friday the 13th refers to a day which is a friday, and which is on the
      13th day of a month.
    - 
    - 

Examples:

friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2


Data Structure:
  - Time object
  - 
  - 

Algorithm

Input: Integer

  1. Initialize number_of_friday_13ths with a value of 0
  2. initialize a beginning_of_year variable with a value of the input year
  3. find the first friday of the year
  4. Increment the current time by a week
  5. If the current day is the 13th day of a month, increment number_of_friday_13ths by 1
  6. Repeat #4, and #5  until the the current time is the year after the input
  7. Return number_of_friday_13ths

Output: Integer

## First Friday ##

Input: Time object

1. If the current_time is a friday, return the current_time
2. Otherwise increment the current_time by one, and loop back to the condition.

Output: Time object

=end

require 'pry'
require 'pry-byebug'

MINUTE = 60
HOUR = MINUTE * 60
DAY = HOUR * 24
WEEK = DAY * 7

def friday_13th(year)
  number_of_friday_13ths = 0
  beginning_of_year = Time.new(year, nil, nil, nil, nil, nil, "utc")

  current_friday = first_friday(beginning_of_year)

  loop do
    current_friday += WEEK
    break if current_friday.year == year + 1
    number_of_friday_13ths += 1 if current_friday.mday == 13
  end

  number_of_friday_13ths
end

def first_friday(current_day)
  loop do
    return current_day if current_day.wday == 5
    current_day += DAY
  end
end

p friday_13th(2015) == 3
# THIS ONE RETURNING FALSE
p friday_13th(1986) == 1
p friday_13th(2019) == 2
p friday_13th(2020) #== 2

=begin
# NOTES
DST is mucking with my method. When DST change happens my added WEEK becomes
an added 6 days and 23 hours. 

There is no discussion of DST in the description.
I guess that would have been a useful added hint if anything, it's not really
pertinent to the question. The question of whether this is for a country that
uses DST or not is irrelevant. This has no bearing on whether a day is Friday
the 13th or not.

I've just got to account for it in my method.

DST starts out true, and then goes to false in april, before returning to true
somewhere later in the year.

DST switch, when it is flicked, something changes.

1. starts as 1, if it becomes 0, then add one hour to the 

I decided to go with utc timezone instead, no dst to contend with.
=end


=begin

___Lingering Questions___
  1. Is there a better way of assigning a timezone to a time object?
  2. Maybe I don't need to include the other constants that I don't use, just
     work out the number of seconds in a week, and assign this as my only constant?
  3. 

# POST-SOLUTION

___First thoughts___
  - I've just read that it may be useful to use Ruby's Date class in the discussion.
  - Instead of looping to find the first friday, and then adding a week each time,
    LS directly assigns the time object to the 13th of the first month from the outset,
    and checks whether it's a friday. Then they use a cool Date#next_month method
    to increment the time by a month.
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


