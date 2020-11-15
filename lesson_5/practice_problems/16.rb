=begin

Aim:

Each UUID consists of 32 hexadecimal characters, and is typically broken into 5
sections like this 8-4-4-4-12 and represented as a string.

It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

Write a method that returns one UUID when called with no parameters.

Questions:
  - 
  - How do I generate the hexidecimal char?
  - 
  - 

Rules
### EXPLICIT:
    - Input: Nothing
    - Output: returns UUID
    * a string which consists of sequences of randomly generated hexadecimal
      characters and dashes.
    - The order of hexadecimals vs hashes is as follows: 8-4-4-4-12
    -
    -

### IMPLICIT:
    -
    -
    -

Examples:

It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

Data Structure:
  - I've got to figure out how to make a random hexadecimal
  - Then I've got to do that in the format of a UUID
    - 8 times, -, 4 times, -, 4 times, -, 4 times, 12 times
  -

Algorithm
  1. Initialize a uuid variable as an empty string
  2. generate a random hexadecimal number
  3. push the string version of this to uuid
  4. repeat 2, 3 n times where n matches the format of uuid
  5. push a '-' to uuid
  6. repeat 2-5 x times where x matches the format of uuid

=end

def generate_uuid
  uuid = []
  uuid_format = [8, 4, 4, 4, 12]

  uuid_format.each do |length|
    sequence = ''

    length.times do
      sequence << random_hexadecimal
    end

    uuid << sequence
  end

  p uuid.join('-')
end

def random_hexadecimal
  rand(16).to_s(16)
end

generate_uuid

def generate_uuid
  uuid = ''

  8.times do
    uuid << random_hexadecimal
  end

  uuid << '-'

  3.times do
    4.times do 
      uuid << random_hexadecimal
    end

    uuid << '-'
  end

  12.times do
    uuid << random_hexadecimal
  end

  p uuid
end

def random_hexadecimal
  rand(16).to_s(16)
end

def generate_uuid
  uuid = []
  uuid_format = [8, 4, 4, 4, 12]

  uuid_format.each do |length|
    sequence = ''

    length.times do
      sequence << random_hexadecimal
    end

    uuid << sequence
  end

  p uuid.join('-')
end

=begin

___Lingering Questions___
  1.
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


