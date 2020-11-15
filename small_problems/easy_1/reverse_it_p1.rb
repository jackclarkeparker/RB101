# Pre-solution

def reverse_sentence(string)
  words = string.split
  words.reverse.join(" ")
end

puts reverse_sentence("") == ""
puts reverse_sentence("Hello World") == "World Hello"
puts reverse_sentence("Reverse these words") == "words these Reverse"

# Post-solution
# The solution's method uses 1 LOC, string.split.reverse.join(" ")
# Sure, why not?