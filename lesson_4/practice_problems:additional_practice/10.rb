=begin

Aim:

Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

Modify the hash such that each member of the Munster family has an additional
"age_group" key that has one of three values describing the age group the
family member is in (kid, adult, or senior).

Your solution should produce the hash below:

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a
senior is aged 65+.

Questions:
  -
  -
  -
  -

Questions that have come up later:
  -
  -
  -

Rules
### EXPLICIT:
    - Input: Hash
    * Hash containing family members names for keys with hash of datapoints
      pertaining to a given family member.
    - Output: Modified Hash
    * Same hash object modified such that the hash of data includes a new
      datapoint - 'age_group'
    - 3 possible values for the 'age-group' key:
      - 'kid' is if they are in the age range of 0-17
      - 'adult' is if they are in the age range of 18-65
      - 'senior' is if they are in the age range above 65.
    -

### IMPLICIT:
    -
    -
    -

Examples:

### INPUT
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

###OUTPUT
{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

Data Structure:
  - The input and output are hashes.
  - We need a conditional structure to determine the value that will be assigned
    to the new key for the hash referenced via each family member's name.
  -

Algorithm
  - Assign the keys of the input hash to an array called `names`
  - Determine the age_group of the current family member
  - Assign the current members age_group
  - Repeat steps 2 & 3 for each family member
  - Return the input hash
  -
  -

=end

def add_age_group(family)
  family_keys = family.keys

  family_keys.each do |member|
    age_group = case family[member]['age']
    when (0..17)  then 'kid'
    when (18..65) then 'adult'
    when (65..)   then 'senior'
    end
    family[member]['age_group'] = age_group
  end

  family
end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

p add_age_group(munsters) == {
  "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

=begin

# POST-SOLUTION

___First thoughts___
  - I have this thought that while I'm writing my PEDAC information, I'm
    making it dense itself, don't want to labour over it. Quick and easy is
    good :)
  - For case statement, didn't need to write the last condition, it was an else
    condition.
  - I thought that it wasn't a good idea to modify a collection as you iterate
    over it. I guess LS's solution doesn't modify the the munsters hash itself,
    but modifies the collection object within it.
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


