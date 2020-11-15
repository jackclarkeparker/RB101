=begin

Aim:
Create a method that takes 2 arguments, an array and a hash. The array will
contain 2 or more elements that, when combined with adjoining spaces, will
produce a person's name. The hash will contain two keys, :title and
:occupation, and the appropriate values. Your method should return a greeting
that uses the person's full name, and mentions the person's title and occupation.

Questions:
  -
  -
  -
  -

Questions that have come up later:
  - Does the order that that the title and occupation are presented in always
    work?
    - Does there need to be a way of rearranging the order of these particulars?
    e.g. "Hello Isaac Newton! Nice to have a Doctor Scientist around."
  -
  -

Rules
### Explicit Requirements:
    - Input: Two Arguments: Array and Hash
    ~ Array contains 2+ elements
      - names of a person
    ~ Hash contains two k/v pairs
      - :title with it's appropriate value
      - :occupation with it's appropriate value
    - Output: Returned String
    ~ Greeting mentioning full name, occupation, and title
    -
    -
    -

### Implicit Requirements:
    - Full name
      - This is found by combining the elements of the input array with
        white space separator.
    -
    -

Examples:

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> Hello, John Q Doe! Nice to have a Master Plumber around.

Data Structure:
  - We're given information about a person, and must use this information
    to form a greeting string.
  -
  -

Algorithm
  - Define the name of the stranger
  - Form a greeting string using the name and hash values offered.
  -
  -
  -

=end

def greetings(name, particulars)
  full_name = name.join(' ')
  title = particulars[:title]
  occupation = particulars[:occupation]

  "Hello, #{full_name}! Nice to have a #{title} #{occupation} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> Hello, John Q Doe! Nice to have a Master Plumber around.

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


