def substrings(string)
  result = []
  starting_index = 0
  until starting_index > string.length - 2
    num_chars = 2
    until num_chars > string.length - starting_index
      substr = string[starting_index, num_chars]
      result << substr
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

def is_palindrome?(string)
  string == string.reverse
end

def palindrome_substrings(string)
  result = []
  substring_arr = substrings(string)
  substring_arr.each do |substr|
    result << substr if is_palindrome?(substr)
  end
  result
end

p palindrome_substrings("supercalifragilisticexpialidocious"); # ["ili"]
p palindrome_substrings("abcddcbA");   # ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome"); # []
p palindrome_substrings("");    