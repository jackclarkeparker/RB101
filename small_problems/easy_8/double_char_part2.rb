=begin

Aim:

Write a method that takes a string, and returns a new string in which every
consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and
whitespace should not be doubled.

Questions:
  - What about auxiliary characters, should they be doubled?
  - Should Vowels in other languages also not be doubled? i.e. with accents
    - How about consonants that are non-english, should they be doubled?
  - What is a consonant character?
    - Characters from the alphabet that we use in English that are not vowels?

Questions that have come up later:
  -
  -
  -

  Rules
    - Input String
    - Output Returned New String
      - Consonant characters must be doubled in the returned string
      - Non consonants (Vowels, Digits, Punctuation, Whitespace), not doubled
    -
    -
    -

Examples:

double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

Algorithm
  - initialize result as an empty string
  - iterate through the characters of input
    - determine whether the character is a consonant
      - Do this by doing a #count call for consonants.
        - if one consonant, push two copies of it to result
        - otherwise, push one copy to result
  - return the result
  -
  -

=end

def double_consonants(string)
  result = ""
  string.each_char do |character|
    consonant = character.downcase.count("a-z", "^aeiou")
    case consonant
    when 1
      result << character << character
    when 0
      result << character
    end
  end
  result
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

=begin

# POST-SOLUTION

___First thoughts___
  - I had been wondering about how to capture consonants, and was worrying the
    idea of using a Constant for a while, encouraging to see that this is what
    was used in the LS implementation. They just went for explicit, letter by
    letter array, written with percent string notation.
    - Gotta say, it's more readable than mine. I wanted a shortcut, something
      clever. In the end mine is less legible for it.
  - I also wondered at the fact that I was repeating myself in a way with my
    case statement, in that I would be appending the character once no matter
    the outcome of the conditional. I wondered about putting the character in
    inserting the character at an earlier stage, but ended up deciding that it
    would be confusing writing this in two places, and better to write it out
    a little clearer by writing in full both conditional outcomes.
    Turns out, when you don't use a case, there is quite a tidy way of doing it.

    The LS solution confines the conditional to an if modifier: add the
    character again if it is a consonant.
    One thing to learn from this is that I wasn't looking for DRY before writing
    my code, I spotted that I was repeating myself afterwards. Because of this,
    I'd already conceived of my code in a world where I used a case statement.
    If I'd A) used the constant for consonants and B) foreseen opportunity to
    DRY, then that would have been the universe where writing the code in the
    way that LS might be something I'd stumble upon. Given that I took a
    different route to defining constants, things didn't turn out pretty well :)
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


