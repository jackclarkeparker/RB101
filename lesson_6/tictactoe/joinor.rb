=begin

Aim:

Write a method called joinor that will produce the following result:

joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

Questions:
  - Should the method also function with types other than Integers?
  - 
  - 
  - 

Rules
### EXPLICIT:
    - Input: Array
    * Array of numbers
    - Output: String
    * String consists of items of array separated by default or supplied 
      general and final separators.
    - 
    - 
    - 
    - 

### IMPLICIT:
    - Two types of separator, general and final
    - Separators have default value of ', ' and ' or ' respectively
    - Arguments can be supplied that can change either separator
    - If there are only two items in the list, the item before the final
      separator shouldn't be appended with the general separator
      - If the number of the items in the list is greater than two, then the
        item before the final separator SHOULD be appended with the general
        separator.

Examples:

joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

Data Structure:
  - Array input, being joined and turned into a string
  - 
  - 

Algorithm

Input: 

  1. join all elements of the input less the final element with the general separator
  2. add on the final separator, and the final element, turned to a string.
  3. 
  4. 
  5. 

- If the array length is less than 2, join the elements with the final separator
- If the array length is greater than 2, insert the final separator as the second
  to last element
  - join all elements except the last element with the general separator
  - append the last element

  1. Determine whethher the length of the array is equal to or less than 2
  2. If it is, join the elements using the final separator
  3. 
  4. 
  5. 

Output: 

=end

def joinor(array, general_separator = ', ', ending_separator = 'or')
  unless array.length > 2
    return array.join(" #{ending_separator} ")
  end

  array.insert(-2, ending_separator)
  final_element = array.pop
  array.join(general_separator) + " #{final_element}"
end

p joinor([1, 2])                   == "1 or 2"
p joinor([1, 2, 3])                == "1, 2, or 3"
p joinor([1, 2, 3], '; ')          == "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   == "1, 2, and 3"

=begin

___Lingering Questions___
  1. 
  2. 
  3. 

# POST-SOLUTION

___First thoughts___
  - LS handled the different conditional outcomes of the join (which are determined
    by the varying length of the input array) with a case statement, which was
    a tidy way of presenting the different execution paths. The entire method
    contained in one single case statement.
  - LS handled the anomaly of difference between how the lists are presented when
    greater than two vs two or less by hardcoding the ending separator directly
    into the final element, resolving any need to write a generic rule for
    generating an outcome that conforms.
    - This was beneficial, because the operations of the program were reduced,
      and it's complexity is lower compared to mine. It is very simple to read.
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


