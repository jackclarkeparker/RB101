=begin

Write a method that takes a string with one or more space separated words and
returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

Aim:
  - input: String
  - output: Hash
  Rules
    - input string
      - One or more space separated words
        - Word - any string of characters that do not include a space
    - output hash
      - key/value - word_length/number_of_words
        - integers
      - Order that pairs are presented doesn't seem to be consistent.
      - Perhaps it has something to do with the operation that you use?
        - Just remembered order of pairs is not of any significance! Not an array.
      - empty string = empty hash
    -
Examples:

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
Seems to imply that hash should be ordered, from shortest length word to longest

word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
Punctuation counts in word length

word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
Happy Path

word_sizes('') == {}
Empty String results in empty hash.

Algorithm
  - Initialize length_of_words as an empty hash
  - Split the input string based on white_space
    - Iterate over the split string, counting the length of each word
    - if length_of_words already has a key for the length of current word
      - increment the value for this key
    - otherwise
      - Create a new key_value pair with current_word length key, with value 1
  -
  -
=end

def word_sizes(input_string)
  length_of_words = {}

  input_string.split(' ').each do |word|
    if length_of_words.has_key?(word.length)
      length_of_words[word.length] += 1
    else
      length_of_words[word.length] = 1
    end
  end

  length_of_words
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }

p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }

p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }

p word_sizes('') == {}

=begin
# Post-Solution

I had been wondering about a smooth way to assign a value of 1 to a
length_of_words key that has yet to exist while still incrementing existing
pairs by 1. I ended up with an overloaded conditional statement, it's not a
behemoth, but there is a smoother way of writing this code, as it turns out.

The solution initilizes the array using explicit object instantiation (with
the ::new class method), passing in an argument of 0. This acts as a default
return value any time that a key is referenced that is not found in the hash.
Without a default return value, reference to a key that doesn't exist will
return nil, and calling `+= 1` on this nil returns:
NoMethodError(undefined method `+' for nil:NilClass)
The same statement executing on the hash where it's default value has been set
to 0 won't raise any exception, and allow the `=` portion of `+=` to set the
value of the new key to `0 + 1`, giving us what we want.

# Further-Exploration

The further exploration portion of this exercise asks for us to look in detail
at the different ways that Hash.new notation can assign default values.

The first is used in the solution, where a single argument is provided, this
acts as the default return value for keys that can't be found. Note that this
return value by itself will not result in the keys assigned a value - they will
still be non-existant in the hash unless they are given a value with a setter
method.

The second way of providing a default value involves instantiating with a block
which will accept two variables - the hash object, and the referenced key.
The return value of this block will be the default return value for a key that
does not exist in the hash, it can be a different return value each time.
Note that the keys can be assigned a value if set inside the block.

=end
