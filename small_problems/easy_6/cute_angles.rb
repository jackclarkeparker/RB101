=begin

Aim: Write a method that takes a floating point number that represents an angle
between 0 and 360 degrees and returns a String that represents that angle in
degrees, minutes and seconds. You should use a degree symbol (°) to represent
degrees, a single quote (') to represent minutes, and a double quote (") to
represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

Note: your results may differ slightly depending on how you round values, but
should be within a second or two of the results shown.

You should use two digit numbers with leading zeros when formatting the minutes
and seconds, e.g., 321°03'07".

You may use this constant to represent the degree symbol:

DEGREE = "\xC2\xB0"

  - input: Integer/Float
  - output: String
  Rules
    - Input Number
      - Can be float or Integer
      - Number represents angle between 0 and 360
        - where number > 360 || number < 0
          - find the delta number.

    - Output String
      - Rep angle in degrees, hours, minutes.
        - angle is whole number
        - minutes and seconds are remaining decimal
          - 60 minutes per degree, 60 seconds per minute
          - Seconds per degree is minutes per degree * seconds per minute
        to find minutes and seconds
          - multiply seconds per degree by remaining decimal
            - round to the nearest if necessary
        - output string format: %(D°MM'SS")
          - Minutes and Seconds must use two digits
            - i.e. leading zero where < 10
          - Degrees has no digit requirements.

  - Resulting second may differ slightly dependng on how we round our number.
  - They've provided a constant with a code that will pull up the degree symbol.

Examples:

dms(30) == %(30°00'00")
Where input is a whole number, minutes/seconds are 00, degree is the number

dms(76.73) == %(76°43'48")
76 degrees, 0.73 of an hour in minutes and seconds

dms(254.6) == %(254°36'00")
Nothing new

dms(93.034773) == %(93°02'05")
Here the hours and minutes don't compute evenly, round

dms(0) == %(0°00'00")
0 is %(0°00'00")

dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
360 is %(360°00'00") or %(0°00'00")

Algorithm
  - Find degrees
    - divide input by one
  - Find minutes / seconds
    - input less degrees multiplied by seconds per degree
      - divmod 60 for minutes and seconds
        - round seconds
  - Format string
  - "%(%(%d{DEGREE}%02d"%02d')) % [degrees, minutes, seconds]

=end

SECONDS_PER_MINUTE = 60
MINUTES_PER_DEGREE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE
DEGREE = "\xC2\xB0"

def dms(number)
  split_number = number.divmod(1)

  degrees = split_number[0]
  minutes, seconds = (split_number[1] * SECONDS_PER_DEGREE).divmod(60)
  seconds = seconds.round

  if seconds == 60
    minutes += 1
    seconds = 0
  end
  # Not sure if there is a way to optimise this. I perform a check here in case
  # seconds has rounded up from 59 to 60 as happens in my program when
  # evaluating the third of the provided examples.

  %(%d#{DEGREE}%02d'%02d") % [degrees, minutes, seconds]
  # Probably save this form of format notation for simple little formats, not
  # like what we've got here, this is a good example of when to go for #sprintf
  # or #format. Apparently, favour #format over #sprintf

  # Also!! We don't need to create a format sequence for degrees, it's not
  # being formatted. Just interpolate.
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

=begin
I didn't realise that the third example is a unique one to recreate.
Any time that seconds are going to round up to 60, we've got to increment
minutes and set seconds to 0

The floating point precision problem seems to be rearing it's head

  - Is "\xC2\xB0" a way of representing an integer?
Don't need to call #chr on it. Something about escaping the x seems to access
a database of characters?

I guess"\x" is an escape sequence
I've determined that "\xnn" is a hexidecimal number where,
  - n is in the range 0-9, a-f, or A-F
"\xC2" is the same as 194, "\xB0" is the same as 176
Why does 194 176 give us a degree symbol?
Escaping numbers in strings does seem to reference characters.
Maybe the solution will tell us.
It didn't.

# POST-SOLUTION

I want to take note of the order that Launch School has chosen to instantiate
their constants. They go with minutes per degree first, and then seconds per
minute, before making the seconds per degree multiplication.

Check whether they used the same rule in the time question. After Midnight
constants.

Well they put DEGREE first. So maybe it's good to lead with unclear random
numbers you've been provided with before setting out your neat organized
set of constants.

They go with the two components that make up the CONSTANT * CONSTANT assignment
first, that much is obvious. Of these two components, they begin with the
larger of the two. i.e. seconds fits into minutes, so they lead with minutes
per degree before going to seconds per minute. I guess that's kind of scaling
into the problem gradually. Degree is something we have closer familiarity with
It's closer to the original number, so we break degree into minutes first,
before then breaking minutes into seconds. Think of it like a slowly zooming in
camera shot. It goes planet, country, city, street, house, roof, tile, grain...
It doesn't go house, planet, tile, country. That sounds fun for a ravey song,
but we're trying to explain a legible thinking process here!

# FURTHER EXPLORATION

=end

puts "FURTHER EXPLORATION"

DEGREE = "\xC2\xB0"
DEGREES_PER_REVOLUTION = 360
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(coordinate)
  if (coordinate < 0) || (coordinate > 360)
    coordinate = coordinate % DEGREES_PER_REVOLUTION
  end

  total_seconds = coordinate * SECONDS_PER_DEGREE
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(MINUTES_PER_DEGREE)

  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")
