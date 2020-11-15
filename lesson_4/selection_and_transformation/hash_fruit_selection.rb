=begin
loop
counter
way to reference current value
way to break loop
selection criteria

In order to loop through the hash we need to turn it into an array
In order to store the key-value pair in the return hash, we need to reference
the value
Otherwise the counter won't work properly.
=end

def select_fruit(food_list)
  fruits = {}
  food_items = food_list.keys
  counter = 0
  # counter initialized

  loop do
  # loop
    current_food = food_items[counter]
    current_type = food_list[current_food]
    # Way of accessing current value

    if current_type == 'Fruit'
    # selection criteria
      fruits[current_food] = current_type
    end

    counter += 1
    # counter  incrementing
    break if counter == food_items.size
    # way of exiting loop
  end

  fruits
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

=begin

# First thoughts
- They call their keys produce_keys. It's good to call something that contains
  keys ____keys. It's not like you're hiding this fact.
- Same with their returned hash, I called it just fruits, but they called it
  selected fruits. It's okay to mention that they're selected. It's as though
  I'm afraid that by mentioning that `selected_` I'll be exposing machinery
  that should remain hidden. It's good to reference that, it makes things clear
- LS also puts the break condition at the beginning of the loop which prevents
  empty input from throwing an error.


