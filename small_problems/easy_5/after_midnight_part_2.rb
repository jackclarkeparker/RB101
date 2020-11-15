=begin

Aim:
  - input: String hh:mm time
  - output: Integer - number of minutes
  Rules
    - Two methods
      - One showing mins before midnight
      - One showing mins after midnight
    - Integer within (0..1439)
      - Integer must be positive.
    - ((No Date/Time, No DLS or other irregularities))
    -
Examples

after_midnight('00:00') == 0
Midnight is 0 minutes after midnight
before_midnight('00:00') == 0
And 0 minutes before midnight
after_midnight('12:34') == 754
Happy path
before_midnight('12:34') == 686
Shows that minutes before is also positive
after_midnight('24:00') == 0
midnight as expressed by '24:00' is also 0 minutes before and after midnight
before_midnight('24:00') == 0

Algorithm
MINUTES AFTER
  - Separate numbers in string
    -':' delimiter
  - transform String nums to Integer nums
    - multiply hours integer by mins_per_hour
  - set minutes_after_midnight to the sum of the integers
  - reassign minutes_after_midnight to modulus of minutes_after_midnight and mins_per_day

MINUTES BEFORE
  - find mins_per_day - minutes_after_midnight

=end

MINS_PER_HOUR = 60
MINS_PER_DAY = MINS_PER_HOUR * 24

def after_midnight(time_string)
  hours, minutes = time_string.split(":").map(&:to_i)
  minutes_after_midnight = (hours * MINS_PER_HOUR) + minutes
  minutes_after_midnight % MINS_PER_DAY
end

def before_midnight(time_string)
  minutes_before_midnight = MINS_PER_DAY - after_midnight(time_string)
  minutes_before_midnight % MINS_PER_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

# POST-SOLUTION
=begin

The solution is very similar to mine! They still assign HOURS_PER_DAY, despite
not referencing it in the program itself, only using it when assigning the
MINS_PER_DAY constant. This is perhaps a clearer way of stating MINS_PER_DAY
I wonder whether it's important to show that a constant is not being used in the
program but perhaps this is not of great consequence, or at least, perhaps not
in a program of this size.
The first line of code is literally exactly the same, they never assign the
minutes_after_midnight variable, instead option to calculate the sum of time
integers and finding the modulo against MINS_PER_DAY all on one line. It's pretty
legible.

Their before_midnight method still uses `delta_minutes` as a variable name, and
rather than using modulo to deal with 1440 edge case, they a conditional -
  set delta_minutes to 0 if delta_minutes == MINS_PER_DAY

This is not of great comment. Why wouldn't they use this in the first method?
Maybe because they weren't dealing with a variable in that instance, and it
would make the code unnecessarily lengthy. I think it's fine. Moving on.

=end

# FURTHER-EXPLORATION (Now with Date and Time)
=begin
Aim:
  - input: String hh:mm time
  - output: Integer minutes before/after midnight
  Rules
    - Two methods
      - minutes before midnight, minutes after midnight
    - Can use Date and Time.
    - Integer within (0..1439)
    -
Examples

after_midnight('00:00') == 0
Midnight is 0 minutes after midnight
before_midnight('00:00') == 0
And 0 minutes before midnight
after_midnight('12:34') == 754
Happy path
before_midnight('12:34') == 686
Shows that minutes before is also positive
after_midnight('24:00') == 0
midnight as expressed by '24:00' is also 0 minutes before and after midnight
before_midnight('24:00') == 0

Algorithm
  - assign constants
    - hours per day
    - minutes per hour
    - minutes per day
    - seconds per minute
    - midnight

  - require 'time'  << Is this okay here?
  (maybe it needs to be before midnight constant?) Yes

  - AFTERMIDNIGHT
  - parse timestring to find time object for input time
  - find time differential of input time and midnight
    convert to minute form
  - find time differential within a single day - moduluo minutes_per_day

  - BEFORE MIDNIGHT
  - find mins_per_day - minutes_after_midnight % mins_per_day

=end

require "time"

HOURS_PER_DAY = 24
MINS_PER_HOUR = 60
MINS_PER_DAY = HOURS_PER_DAY * MINS_PER_HOUR
SECS_PER_MINUTE = 60
MIDNIGHT = Time.parse("00:00")

def after_midnight(time_string)
  input_time = Time.parse(time_string)
  delta_minutes = (input_time - MIDNIGHT).to_i / SECS_PER_MINUTE
  delta_minutes % MINS_PER_DAY
end

def before_midnight(time_string)
  (MINS_PER_DAY - after_midnight(time_string)).to_i % MINS_PER_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
