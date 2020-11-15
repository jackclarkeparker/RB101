hsh = {
  first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'],
  fourth: ['over', 'the', 'lazy', 'dog']
}

all_vowels = []
hsh.each_value do |array|
  array.each do |word|
    all_vowels << word.scan(/[aeiou]/)
  end
end

p all_vowels.flatten.join


VOWELS = %w(a e i o u)

all_chars = []
hsh.each_value do |array|
  array.each do |word|
    all_chars.concat(word.chars)
  end
end

all_vowels = all_chars.select do |char|
  VOWELS.include?(char)
end

p all_vowels.join

# VOWELS doesn't need to be an array, a string of the vowels is fine in this case.