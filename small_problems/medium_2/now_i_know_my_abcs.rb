=begin

Aim:

A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do
not use both letters from any given block. Each block can only be used once.

Write a method that returns true if the word passed in as an argument can be
spelled from this set of blocks, false otherwise.

Questions:
  - Can the input be multiple words?
    - Space delimited? (there is no whitespace in the spelling blocks)
  A No
  - Do words have to be uppercase to return true?
  A No, case insensitive
  - Can the letters on either side of the block be included in the word?
  A Yes
  - How should I treat an empty string?
  A I guess I'll return it true, because it's not using a spelling block more
    than once???
  - Do I need to handle multiple strings passed into the method?
  A No

Rules
### EXPLICIT:
    - Input: String
    * A single word
    - Output: Boolean
    * true/false depending on whether the characters of input match with unique
      'spelling blocks'
    - Can't use both letters from any given block
    - Can only use each block once
    - 

### IMPLICIT:
    - Case insensitive
    - Can use the letter from either side of any given block
    - 
    - 

Examples:

block_word?('BATCH') == true
Happy Path

block_word?('BUTCH') == false
Can't use the same block more than once

block_word?('jest') == true
Case insensitive spelling blocks

block_word?('') == true
Doesn't use the same block twice


Data Structure:
  - We need a key with all the spelling blocks
  - We have an input string that must be iterated over
  - We'll need a condition that will return false if a spelling block is used
    more than once.

    Hash data structure for the key
    Iterating over each character of the string

Algorithm
  1. initialize the spelling blocks in a hash structure
  2. Iterate over the input
     - search for a match in the spelling block hash with the current character
       - delete this spelling block if you find it
       - return false if you don't
  3. Return true if there are no issues finding a spelling block for each char
  4. 
  5. 

=end



def block_word?(word)
  spelling_blocks = { 
  'B' => 'O', 'X' => 'K', 'D' => 'Q', 'C' => 'P',
  'N' => 'A', 'G' => 'T', 'R' => 'E', 'F' => 'S',
  'J' => 'W', 'H' => 'U', 'V' => 'I', 'L' => 'Y',
  'Z' => 'M'
}

  word.each_char do |char|
    return false unless spelling_blocks.reject! do |first, second|
      (first == char.upcase) || (second == char.upcase)
    end
  end

  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('') == true

=begin

___Lingering Questions___
  1. 
  2. 
  3. 

# POST-SOLUTION

___First thoughts___
  - LS chose to handle case insensitivity by creating an upcase string up front
    to iterate over.
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


