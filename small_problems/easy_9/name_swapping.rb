=begin

Aim:

Write a method that takes a first name, a space, and a last name passed as a
single String argument, and returns a string that contains the last name, a
comma, a space, and the first name.

Questions:
  - Are we returning the same string, or a new string?
  - Can first name contain two names?
  - Can last name be hyphenated?
  -
  -

Questions that have come up later:
  -
  -
  -

Rules
### EXPLICIT:
    - Input: String
    * consists of: first name, space, last name
    - Output: String
    * consists of: last name, comma, space, first name
    -
    -
    -

### IMPLICIT:
    -
    -
    -

'xxx yyy' --> 'yyy, xxx'
'first last' --> 'last, first'

Examples

swap_name('Joe Roberts') == 'Roberts, Joe'
Happy Path

Data Structure:
  - String input, string output, we need to shuffle the order of them around
  - An array would be useful:
    - turn names into elements
    - move elements into a new order.
  -

Algorithm
  - Split input string into name composites
  - reverse the order of the array
  - join the elements of the array back together with a comma and space
  - return 
  -

=end

def swap_name(full_name)
  full_name.split.reverse.join(', ')
end

def swap_name(full_name)
  name_composites = full_name.split
  name_composites.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

=begin

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

Questions:
  -
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


