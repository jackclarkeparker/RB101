=begin

Aim:

Mad libs are a simple game where you create a story template with blanks for
words. You, or another player, then construct a list of words and place them
into the story, creating an often silly or funny story as a result.

Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and
an adjective and injects those into a story that you create.

Questions:
  - Can blanks be filled with more than one word?
  - What if blanks are left blank?
  - Do we need to filter inappropriate language?
  - Need to validate input?
    - Empty input?
    - More than one word?
  - Does output need to be returned? Printed? Both?

  - input: User inputted Strings
  - output: printer String
  Rules
    - retrieve input from user
    - 
    -
    -
    -

Example

Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly



Algorithm
  - Assign MESSAGES constant to madlibs_messages.yml file
  - prompt user for input * 4
    - validate each entry
      - Invalid if empty
      - Invalid if more than one word
  - print madlib to output
  -
  -

=end

require "yaml"
MESSAGES = YAML.load_file("madlibs_messages.yml")

def valid?(input)
  input.strip!
  !(input.include?(" ") || input.empty?)
end

def retrieve_input(word_type)
  puts MESSAGES[word_type]
  loop do
    input = gets.chomp
    break input if valid?(input)
    puts MESSAGES["invalid"]
  end
end

def madlibs_story
  noun = retrieve_input('noun')
  verb = retrieve_input('verb')
  adjective = retrieve_input('adjective')
  adverb = retrieve_input('adverb')
  options = [
  ['sentence1', [noun, verb, adverb, adjective]],
  ['sentence2', [verb, noun, adverb, adjective]],
  ['sentence3', [adjective, noun, adverb, verb]]
  ]
  sentence = options.sample
  puts MESSAGES[sentence[0]] % sentence[1]
end

madlibs_story

# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly

# Do you walk your blue dog quickly? That's hilarious!