def palindromic_string?(string)
  string == string.reverse
end

p palindromic_string?('madam') == true
p palindromic_string?('Madam') == false
p palindromic_string?("madam i'm adam") == false
p palindromic_string?('356653') == true

def palindromic_array?(array)
  array == array.reverse
end

p palindromic_array?([1, 2, 3, 2, 1]) == true
p palindromic_array?([11, 2, 3, 2, 1]) == false
p palindromic_array?([1, 2, 3, ' ', 2, 1]) == false
p palindromic_array?(['1, 2, 3, 2, 1']) == true
p palindromic_array?(['']) == true
p palindromic_array?([]) == true

def palindrome?(candidate)
  candidate == candidate.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false
p palindrome?("madam i'm adam") == false
p palindrome?('356653') == true
p palindrome?([1, 2, 3, 2, 1]) == true
p palindrome?([11, 2, 3, 2, 1]) == false
p palindrome?([1, 2, 3, ' ', 2, 1]) == false
p palindrome?(['1, 2, 3, 2, 1']) == true
p palindrome?(['']) == true
p palindrome?([]) == true
