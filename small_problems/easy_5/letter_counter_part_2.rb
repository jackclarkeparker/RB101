=begin

Modify the word_sizes method from the previous exercise to exclude non-letters
when determining word size. For instance, the length of "it's" is 3, not 4.

Aim:
  - input: String
  - output: Hash
  Rules
    -Input String
      - One or more space separated words
    -Output Hash
      - key/value ~ length of word / number of appearances
    -length of word only includes alphabetic characters.

Examples

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
seven. is now a five character word

word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
diddle, - 6, fiddle! - 6

word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
What's - 5
word_sizes('') == {}

Algorithm
  - Initialize Constants
    - Alphabet Constant
  - Initialize results hash
  - Split string into array of words
  - Iterate through array of words
    - Count alphabetic letters in each word
    - Update results hash with word-length entry
  - return results hash

=end

def word_sizes(string)
  results_hash = Hash.new(0)

  string.split.each do |word|
    results_hash[word.count("a-zA-Z")] += 1
  end

  results_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }

p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }

p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }

p word_sizes('') == {}
