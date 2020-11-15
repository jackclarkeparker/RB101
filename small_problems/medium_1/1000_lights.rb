=begin

Aim:

You have a bank of switches before you, numbered from 1 to n. Each switch is
connected to exactly one light that is initially off. You walk down the row of
switches and toggle every one of them. You go back to the beginning, and on
this second pass, you toggle switches 2, 4, 6, and so on. On the third pass,
you go back again to the beginning and toggle switches 3, 6, 9, and so on. You
repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and
returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

Questions:
  - Am I supposed to print an output describing the state of lights on vs. off?
  A~I don't think so, and will go on the assumption that I only need to return
  the array of lights that are on. Actually it literally says this in the
  description
  - Do I need to validate input?
  A~I'm going to say no
    - Will the input number always be a +ve integer?
    A~I'm going to say yes.
  
  -

Questions that have come up later:
  -
  -
  -

Rules
### EXPLICIT:
    - Input: Integer
    * Number of switches in bank
    - Output: Array
    * Elements consist of integers representing the switches that are turned on
    ~~When switches 1, 4, and 9 are on, return:[1, 4, 9]
    - Switches all start in off position
    - Question involves toggling switches in a pattern that consists of:
      - toggle every switch
      ~~toggle: 1, 2, 3, ..n
      - toggle every second switch
      ~~toggle: 2, 4, 6..
      - toggle every third switch
      ~~toggle: 3, 6, 9..
      - toggle every n switch
      ~~toggle: n

    -

### IMPLICIT:
    - Returned array should store switches that are turned on in numerical order.
    -
    -

Examples:

Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

method[5] == [1, 4]
method[10] == [1, 4, 9]

Data Structure:
  - An array of all switches.
    - they all start off.
  - We've got to iterate over this array n times.
  - We'll want to modify the array each time we iterate.
  - We'll want to return an array showing those switches that are turned on
    after the final iteration.
  -

[false, false, false, false, false]
[switch1, switch2, switch3, switch4...]

Algorithm
  1. Initialize collection of n switches in off position
  2. Toggle switches
  3. Return an array of those switches that are turned on.
  4.

AIM: Toggle collection of switches

- Question involves toggling switches in a pattern that consists of:
      - toggle every switch
      ~~toggle: 1, 2, 3, ..n
      - toggle every second switch
      ~~toggle: 2, 4, 6..
      - toggle every third switch
      ~~toggle: 3, 6, 9..
      - toggle every n switch
      ~~toggle: n

Algorithm
  1. assign interval to 1
  2. assign current_position to interval
  3. toggle element in bank at current_position
  4. increment current_position by interval
  5. repeat steps 3 and 4 until current_position > collection size
  6. increment interval by 1
  7. repeat steps 2-6 until interval > collection size
  8. return array of switches that are turned on
     - where the array is on, replace it with it's number
     - where it is off, remove it.

=end

# Generates pattern for light switches
def toggle_sequence(bank)
  interval = 1

  until interval > bank.size
    position = interval - 1

    while position < bank.size
      bank[position] = !bank[position]
      position += interval
    end

    interval += 1
  end

  sequence_to_array(bank)
end

# Turns true/false pattern into return array
def sequence_to_array(bank)
  bank.map!.with_index { |switch, i| switch ? i + 1 : false }
  bank.select { |switch| switch }
end

def lights_left_on(number_of_switches)
  switch_bank = Array.new(number_of_switches, false)
  lights_left_on = toggle_sequence(switch_bank)
end

p lights_left_on(5) == [1, 4]
p lights_left_on(10) == [1, 4, 9]
p lights_left_on(1000)

# Is it confusing how I use until and while? Is there a way for me to write
# this more consistently? It feels like I'm working it out in what may be an
# idiosyncratic way. It's not that it's idiosyncratic. I use until interval >
# bank.size because interval has not been converted to an index. It is being
# used for another purpose - adding the correct interval to the index of the
# current_position.with while current_position < bank.size, i have to reference
# current_position because that is the value being incremented, and in this case
# we use while, because we're testing while the value is less than. until is greater than
# while is less than.
# Unless you're approaching the break condition in a descending sequence instead
# until is when you break out of the bounds
# while is when you come into contact with the bounds.
# Just always, while is about approaching a limit and stopping when it meets
# the limit
# until is about approaching a limit and stopping when it exceeds the limit.



=begin

___Lingering Questions___
  1. LS used a hash.
  2.
  3.

# POST-SOLUTION



___First thoughts___
  -
  -
  -
  -

___Mental Model Modifications___
  -
  -

# FURTHER EXPLORATION

Aim:

Why are all light left on perfect squares?
A~ Perfect squares are unique in that they have an odd number of factors, all
   other numbers have an even set of factors. In this exercise we are toggling
   the switches based on multiples of every number between 1 and n, the switches
   will all be toggled when the interval being hopped with each flick of a switch
   matches one of their factors. All switch positions that have an even number
   of factors will therefore be switched and even number of times, which leads
   them back to the initial state of off. Perfect squares, with an odd number
   of factors will be switched and odd number of times, and ending up on.

What are some alternatives for solving this exercise? What if we used an Array
to represent our 1000 lights instead of a Hash, how would that change our code?
A~ I used an array in my solution.

We could have a method that replicates the output from the description of this
problem (i.e. "lights 2, 3, and 5 are now off; 1 and 4 are on.") How would we
go about writing that code?
A~ below

Questions:
  - Do we need to include the initial "Every light is on/off?"
  - Should we print on multiple lines if the string is really long?
  -
  -

  Rules
    - Input array
    * Number representing switches that are on
    - Output String printed
    * String printed to say which switches are off, and which are on.
    - Format for output string is:
    * "Lights 1, 2, 3, 4, 5, 6, and 7 are off; 8 and 9 are on."
      - Two halves to the string delimited by ';'
        - First half are those lights that are off
        - Second half are those that are on
      - Comma delimited listing of all numbers in consecutive order until the
        last number arrives, which ends with:
        'and <last_number> are off;'
        ||
        'and <last_number> are on'
      - If there are only two numbers, no comma delimiting, just:
        '<first_number> and <second_number> are..'


Examples:

lights_that_are_on(5)

[1, 2, 3, 4, 5] --> round 1: every light is turned on
[1, 3, 5]       --> round 2: lights 2 and 4 are now off; 1, 3, 5 are on
[1, 5]          --> round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
[1, 4, 5]       --> round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
[1, 4]          --> round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

Data Structure:

- We'll need a list of the switches that are off as well as those that are on?
  - No, we're printing this output before we've condensed to a list of only
    those switches that are on.

Options:
  - Construct a string and then print it
    - This is advantageous because we can insert newlines?
  - Print lots of mini strings

Algorithm
  - Initialize a off_switches and on_switches to two empty subarrays
  - Iterate through bank of switches, pushing the switch number for any switches
    that are off to off_switches, and any that are on to on_switches.
  - 
  -

=end

def toggle_sequence(bank)
  interval = 1

  until interval > bank.size
    position = interval - 1

    while position < bank.size
      bank[position] = !bank[position]
      position += interval
    end

    if interval == 1
      puts "Round 1: every light is turned on"
      sleep(3)
    else
      off_switches, on_switches = current_switch_state(bank)
      print_switch_state(off_switches, on_switches, interval)
    end

    interval += 1
  end

  sequence_to_array(bank)
end

def current_switch_state(bank)
  array = [[], []]
  
  bank.each_with_index do |switch, index|
    current_switch = index + 1

    if switch
      array[1] << current_switch
    else
      array[0] << current_switch
    end
  end

  array
end

# OFF OUTPUT
#     - initialize `output` as an empty string
#     - push the first off value to `output`
#     * 'lights <first_num>'
#     - iterate through the off_switches elements between index 1 and -2, pushing each to `output`
#     * ', <num>'
#     - push the last off switches value to `output`
#     * ' and <last_num> are off; '
#     - push the first on value to `output`
#     * '<first_num>'
#     - iterate through the on_switches elements between index 1 and -2, pushing each to `output`
#     * ', <num>'
#     - push the last on value to `output`
#     * ' and <last_num> are on'

def print_switch_state(off_switches, on_switches, iteration)
  output = "Round #{iteration}: "

  output << "Lights #{off_switches[0]}"
  off_switches[1..-2].each do |switch|
    output << ", #{switch}"
  end
  output << " and #{off_switches[-1]} are off;"

  output << " #{on_switches[0]}"
  on_switches[1..-2].each do |switch|
    output << ", #{switch}"
  end
  output << " and #{on_switches[-1]} are on"

  puts output
  sleep(3)
end

def sequence_to_array(bank)
  bank.map!.with_index { |switch, i| switch ? i + 1 : false }
  bank.select { |switch| switch }
end

def lights_left_on(number_of_switches)
  switch_bank = Array.new(number_of_switches, false)
  lights_left_on = toggle_sequence(switch_bank)
end

p lights_left_on(5) == [1, 4]
p lights_left_on(10) == [1, 4, 9]
p lights_left_on(1000)
