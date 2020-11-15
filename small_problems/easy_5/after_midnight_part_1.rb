=begin
Aim:
  - input: Integer
  - output: String
  Rules
    - input integer represents minutes before or after midnight
      - +ve is after midnight, -ve is before midnight
    - return String is time of day in 24 hour format (hh:mm)
    - method should work with any integer input
    - No Date or Time class
Examples

time_of_day(0) == "00:00"
  0 is equal to midnight
time_of_day(-3) == "23:57"
  negative integers are minutes before midnight
time_of_day(35) == "00:35"
  positive integers are minutes after midnight
time_of_day(-1437) == "00:03"
  negative minutes approaching midnight again (1440)
time_of_day(3000) == "02:00"
  integer can be greater than a day
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

Algorithm
  - find hour
    - divide input by 60
      - where positive, modulo 24
      - where negative, add 24 until positive
  - find minute
      - modulo input by 60
  - turn into string output
    - where two digit, to_s
    - where single digit, '0' + num.to_s
  - add hour + colon + minute



  - find hours / minutes format for displacement (divmod integer by 60)
  - find hour (hours % 24)
  - turn values into strings, and concatenate with colon in the middle
  -
=end

def find_hour(hours)
  if hours >= 0
    hours % 24
  else
    until hours >= 0
      hours += 24
    end
    hours
  end
end

def to_printable_time(num)
  if num < 10
    '0' + num.to_s
  else
    num.to_s
  end
end

def time_of_day(displacement)
  displaced_hours, minute = displacement.divmod(60)
  hour = find_hour(displaced_hours)

  hour = to_printable_time(hour)
  minute = to_printable_time(minute)

  hour + ":" + minute
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

=begin

Glanced at solution and approach/algorithm section
They use format (sprintf) to bring the correct formatting to the hour and
minute variables.I've implemented a version of this below to replace my
to_printable_time method.

=end

def find_hour(hours)
  if hours >= 0
    hours % 24
  else
    until hours >= 0
      hours += 24
    end
    hours
  end
end

def time_of_day(displacement)
  displaced_hours, minute = displacement.divmod(60)
  hour = find_hour(displaced_hours)

  hour = sprintf("%02d", hour)
  minute = sprintf("%02d", minute)

  hour + ":" + minute
end

=begin

Having looked more closely at the solution, I see that they are assigning two formats
to two variables on the same line, I'll take a look at this documentation.

So, as it turns out, the initial string pattern argument passed into #sprintf
and #format can contain any extra characters that do not fall within the pattern
delimiters (%..<flag>) and these will copied into the returned string.

The solution uses the following format invocation:

format('%02d:%02d', hours, minutes)

The string argument provided is simply a string containing two format sequences,
delimited by % and d. The colon in between is just to fit the format of the final
string.

If we only provide one other argument to a format string with more than one format
sequence, we'll get an argument error.

It also turns out that there is another way of implementing formatting in Ruby,
which is simply to enter the format string, invoke the % operator and follow with
the arguments to apply the format sequences to:
"%02d:%02d" % hour, minute


The solution does two other cool things:
  - it assigns several Constants at the beginning of the program:
  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

    By doing this, the modulo/divmod operations that take place in the program are
    easier to read and understand.

  - Beyond this, by assigning MINUTES_PER_DAY, we can now remove extraneous minutes
  so that we land within a 24 hour cycle:

    total_minutes % MINUTES_PER_DAY

    In ruby, the sign of the modulus will be the same as the sign of the divisor.
    Because we are performing with a positive divisor in the above modulo operation,
    we will always end up with a positive number of minutes.

    This positive number can be found essentially by finding the remainder off
    the divisor. GOD THIS IS HARD TO ARTICULATE. Because the remainder is a synonym
    for the remainder, and I've just explained how the modulus is always positive
    when the divisor is positive. If you take the 



  Further Exploration

How would you approach this problem if you were allowed to use ruby's Date and
Time classes? Suppose you also needed to consider the day of week? (Assume that
delta_minutes is the number of minutes before or after midnight between
Saturday and Sunday; in such a method, a delta_minutes value of -4231 would
need to produce a return value of Thursday 01:29.)

Aim:
  - input: Integer
  - output: String
  Rules
    - input integer represents minutes before or after midnight Sunday
      - +ve is after midnight, -ve is before midnight
    - return String <day of week> & time of day in 24 hour format (hh:mm)
    - Time breakdowns
      - mins_per_hour = 60
      - hours_per_day = 24
      - mins_per_day = mins_per_hour * hours_per_day
      - mins_per_week = mins_per_day * 7
      - Conversion hash day_of_the_week
    - sprintf to find format for time
Examples

time_of_day(-4231) == "Thursday 01:29 ."

Algorithm
  - assign constants
    - base_time = time object for 23rd Aug 2020, 00:00
  - find delta_seconds
  - find indicated time
    - base_time + delta_seconds
  - return string formatted time object to show day and time.
=end

BASE_TIME = Time.new(2020, 8, 23, 0, 0, 0)

def time_of_day(delta_minutes)
  delta_seconds = delta_minutes * 60
  time = BASE_TIME + delta_seconds
  time.strftime("%A %H:%M ")
end

puts time_of_day(-4231)
