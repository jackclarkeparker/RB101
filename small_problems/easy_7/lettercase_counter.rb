=begin

Aim:

Write a method that takes a string, and then returns a hash that contains 3
entries: one represents the number of characters in the string that are
lowercase letters, one the number of characters that are uppercase letters, and
one the number of characters that are neither.

  - input: String
  - output: Hash
  Rules
    - Input String
      - Can be empty
      - Contains all types of characters

    - Output Hash
      - 3 entries
        - Number of lowercase letters
        - Number of uppercase letters
        - Number that are neither

Examples

letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
White space is non alphabetic

letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
Happy

letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
Happy

letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
Empty has 0 for all counts

Algorithm
  - Initialize character_breakdown
  - set lowercase with count
  - set uppercase with count
  - set non upper/lower with count
  - return character_breakdown

=end

def letter_case_count(string)
  character_breakdown = {}
  character_breakdown[:lowercase] = string.count('a-z')
  character_breakdown[:uppercase] = string.count('A-Z')
  character_breakdown[:neither] = string.count('^a-zA-Z')
  character_breakdown
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }