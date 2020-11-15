=begin

Aim:

Write a method which takes a grocery list (array) of fruits with quantities and
converts it into an array of the correct number of each fruit.

Questions:
  - Am I required to modify the plurality of a string if it is inconsistent
    with the quantity requested?
  A~No
  - Should I be returning the same array that is passed into the method, or a
    new array?
  A~Not important
  - Will the quantity ever be less than 1?
    - How to handle negative quantities?
  -

Questions that have come up later:
  -
  -
  -

Rules
### EXPLICIT:
    - Input: Array of tuples
    * each tuple consists of a) a fruit, and b) a quantity required
    ^ [['apples', 3], ['bananas', 2]]
    - Output: Array
    * a list of all the fruit required, with the correct number of each fruit
      specified all as separate elements
    ^ ['apples', 'apples', 'apples', 'bananas', 'bananas']
    -
    -
    -

### IMPLICIT:
    -
    -
    -

Examples:
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

Data Structure:
  - Constructing an array
    - Unspecified whether to build a new array, or modify the existing one.
  - Array will consist of list of elements found by multiplying the fruit in
    each tuple by it's quantity
  -

Algorithm
  - Initialize an expanded_grocery_list as an empty array
  - Convert the grocery_list into a hash
  - 
  - iterate through the input grocery_list
    - iterate through each item
      - push the fruit to the expanded_grocery_list
      - decrement the quantity by 1
      - break when the quanitiy is less than 1
  - Return the expanded_grocery_list
  -
  -

=end

def buy_fruit(grocery_list)
  expanded_grocery_list = []
  grocery_list = grocery_list.to_h

  grocery_list.each do |fruit, quantity|
    quantity.times do
      expanded_grocery_list << fruit
    end
  end

  expanded_grocery_list
end


p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

def buy_fruit(list)
  list.each_with_object([]) { |item, arr| item[1].times { arr << item[0]} }
end

=begin

# POST-SOLUTION

___First thoughts___
  - LS provides two solutions, The first follows the same route as ours.
    There are two syntax shortcuts that they use:
    - Turning the quantity.times call into a one line block
    - Instead of converting the grocery_list into a hash (I thought noticing
      the hash structure would earn me kudos) LS uses multiple assignment
      with the existing tuple structure to access the values at tuple[0] and
      tuple[1]
  - Their second solution is a one liner, it uses #map. I'll try and build one
    using map now.
    - I ended up going with an #each_with_object one liner instead. It works!
      But is also complicated and dense, and involves a {} block within a {}
      block.

    - Their second solution is nice and clean. It uses #map and assigns two
      parameters for the block to iterate with. I didn't realise you could
      specify two parameters like that. My understanding was that #map would
      accept a parameter for a single element.
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


