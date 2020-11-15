=begin

Aim:

Write a program that reads the content of a text file and then prints the
longest sentence in the file based on number of words. Sentences may end with
periods (.), exclamation points (!), or question marks (?). Any sequence of
characters that are not spaces or sentence-ending characters should be treated
as a word. You should also print the number of words in the longest sentence.

Questions:
  - How will I run my program on a .txt file?
    - I have the .txt file now. Maybe I'll need to import it?
    - I will start out by building the program for the string they've provided.
  
  - How are sentences defined in this context?
  A.Sentences end with periods (.), exclamation points (!), or question marks (?)
  
  - How is 'word' defined in this context?
  A.Any sequence of non whitespace, non sentence-ending characters should be
    treated as a word
    - Even if the sequence of characters is only one character long?
    A.Yes
    - If a word is adjacent to some sentence-ending punctuation, should I
      include this in the word?
    A.It doesn't matter, but does make things simpler at the end. Go for it.
  
  - What if there is a sequence of more than one sentence-ending characters?
    Should they each be treated as separate empty string sentences?

  - Are sentence-ending characters part of the sentences that they end?

Rules
### EXPLICIT:
    - Input: Text file? (Start off with string)
    * 
    - Output: Print substring
    * The longest sentence in the file (by words), followed by
      the number of words in the sentence.

    - Sentences end with periods (.), exclamation points (!),
      or question marks (?)
    - Any sequence of non whitespace, non sentence-ending characters should be
      treated as a word.
    - 

### IMPLICIT:
    - 
    - 
    - 

Examples:

Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth.

The longest sentence in the above text is the last sentence, it is 86 words long,
(note that `--` counts as word)

Data Structure:
  - Need to find all the sentences in the text
  - Need to count the number of words that are in each sentence
  - Array for counting, and collections

One way would be to create a giant array with all the sentences in their own separate arrays

Algorithm
  1. Find all the sentences in the input text
     - Pull each sentence from the greater input
       - A sentence can be pulled upon reaching sentence ending punctuation:
       '!', '?', '.'
  2. Record the type of sentence ending punctuation each sentence uses.
     - Search the input for the sentence.
       - Retrieve the character whose index comes after the last character of
         the sentence.
         - Use the length of the sentence to find this.
         * 'word.' --> 'word'
         * 'word' is 4 chars long
         * find char at index of 'word' + 4

  3. Append the sentence ending punctuation to the sentence.
  4. Count the number of words in each sentence
     - Pull each word from it's sentence
       - A word can be pulled upon reaching whitespace: ' '
  5. Determine the sentence with the most words
     - Compare your different sentences to find the one with the highest
       word count.
  6. Print this sentence, followed by the number of words it contains.


Now, how can we pass an external text file into this program?

=end

require 'pry'

def longest_sentence(text)
  sentences = []

  while text.length > 0
    sentences << text.slice!(0..text.index(/[.!?]/))
  end

  sentences.map! { |sentence| sentence.split }
  sentences.sort_by! { |sentence| sentence.size }

  longest_sentence = sentences.last
  number_of_words = longest_sentence.size
  puts longest_sentence.join(' ') + " (#{number_of_words})"
end

book = File.read('84-0.txt')

# input_text = \
# "Four score and seven years ago our fathers brought forth
# on this continent a new nation, conceived in liberty, and
# dedicated to the proposition that all men are created
# equal.

# Now we are engaged in a great civil war, testing whether
# that nation, or any nation so conceived and so dedicated,
# can long endure. We are met on a great battlefield of that
# war. We have come to dedicate a portion of that field, as
# a final resting place for those who here gave their lives
# that that nation might live. It is altogether fitting and
# proper that we should do this.

# But, in a larger sense, we can not dedicate, we can not
# consecrate, we can not hallow this ground. The brave
# men, living and dead, who struggled here, have
# consecrated it, far above our poor power to add or
# detract. The world will little note, nor long remember
# what we say here, but it can never forget what they
# did here. It is for us the living, rather, to be dedicated
# here to the unfinished work which they who fought
# here have thus far so nobly advanced. It is rather for
# us to be here dedicated to the great task remaining
# before us -- that from these honored dead we take
# increased devotion to that cause for which they gave
# the last full measure of devotion -- that we here highly
# resolve that these dead shall not have died in vain
# -- that this nation, under God, shall have a new birth
# of freedom -- and that government of the people, by
# the people, for the people, shall not perish from the
# earth."

# longest_sentence(input_text)

longest_sentence(book)

# text = File.read('84-0.txt')
# sentences = text.split(/\.|\?|!/)
# largest_sentence = sentences.max_by { |sentence| sentence.split.size }
# largest_sentence = largest_sentence.strip
# number_of_words = largest_sentence.split.size

# puts "#{largest_sentence}"
# puts "Containing #{number_of_words} words"

=begin

___Lingering Questions___
  1. 
  2. 
  3. 

# POST-SOLUTION

___First thoughts___
  - LS found the longest sentence through use of max_by, defining the comparison
    criterion for each sentence as sentence.split.size
    - This meant that they didn't need to split and rejoin the sentences,
      making some of the steps in my algorithm arbitrary.
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

binding.pry