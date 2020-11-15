# Pre-Solution

def reverse_words(string)

  words = string.split.map do |word| 
    if word.length >= 5
      word.reverse!
    else
      word
    end
  end

  words.join(" ")
end

puts reverse_words("Professional")
puts reverse_words("Walk around the block")
puts reverse_words("Launch School")
puts reverse_words("      Stay         ")

# Post Solution
# I don't need to use destructive reverse! when I am using map, the value
# returned will be stored in the new array anyway.

# Could use each with destructive reverse!, which would mean you don't need to
# give the else clause, could just :

# words.each { |word| word.reverse! if word.length >= 5 }
