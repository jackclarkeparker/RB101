=begin

Aim:

Write a method that returns a list of all substrings of a string that are
palindromic. That is, each substring must consist of the same sequence of
characters forwards as it does backwards. The return value should be arranged
in the same sequence as the substrings appear in the string. Duplicate
palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous
exercise.

For the purposes of this exercise, you should consider all characters and pay
attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor
"Abc-bA" are. In addition, assume that single characters are not palindromes.


Questions:
  - What is the order that substrings appear in an array?
    - Is it defined by their starting index? Yes.
      And for palindromes that start on the same index, it's smaller first.
  - What is a palindrome?
    - A set of characters that read the same backwords.
  -

  - input: String
  - output: Array
  Rules
    - Input String
    - Output Array of all palindrome substrings
      - stored in the order they appear i.e. early starting index is first
        priority, shorter length is second priority.
    - Palindrome Rules
      - Palindrome is a sequence of characters that are unchanged when their
        order is reversed.
      - Palindromes are case senstive
      - All characters must be taken into account, including "auxilliary"
        characters.
      - Must be more than one character (two is fine)
      - Include all if palindrome appears more than once.

Examples:

palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]

palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

Algorithm
  - Find all_possible_substrings of string
  - Select those substrings from this list that are palindromic.
    - Test for whether a substring is palindromic by whether it is equal
      to it's reversed self.
  - Return palindromic substrings
  -
  -

=end

def leading_substrings(string)
  list_of_substrings = []
  0.upto(string.length - 1) do |index|
    list_of_substrings << string.slice(0..index)
  end
  list_of_substrings
end

def substrings(string)
  all_possible_substrings = []
  0.upto(string.length) do |index|
    all_possible_substrings.concat(leading_substrings(string[index..]))
  end
  all_possible_substrings
end

def palindromes(string)
  all_substrings = substrings(string)
  all_substrings.select { |substr| palindrome?(substr) }
end

def palindrome?(substr)
  substr = substr.delete("^a-zA-Z")
  substr.length > 2 && substr == substr.reverse
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') # == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

=begin

# Post-Solution

I notice that LS makes a palindrome method which returns a boolean and provides
the condition for the loop that selects for palindromes.

This is kind of nice, because it explains the conditional logic. I don't push
my code to a separate method, and it still works fine, it would just be an
additional option to provide clarity if I were to define this condition as a
helper method.

Also notice that I could have arranged my palindrome condition more succinctly
if I used boolean &&.

# FURTHER EXPLORATION

The further exploration asks how you might implement a solution that only
contained alphabetic characters, and asked us to try experimenting with this
In both the palindromic method, and earlier methods.
The operation to remove non alphabetic characters is pretty simple -

String.delete!( "^A-Za-z") will delete any characters that are not in the ranges
A-Z or a-z.

I inserted this code, first in the earlier substrings method, this was pretty
easy, I simply needed to modify the initial string before looping over
it and passing the appropriate slices into the leading_substrings method. This
resulted in the array of all substrings in the string, without any
non-alphabetic characters. Calling the palindromes method on this only returned
alphabetic palindromes.

When trying to insert this code into the palindromes method, things got messier.
The method ended up with duplicates where a single palindrome would be recorded
twice - for example, the two elements that had been stored as '-madam' and 
'-madam-' in the all_possible_substrings array had their hyphens removed by the
delete! call, and were recognized as palindromes, but their shouldn't be two
palindromes in this instance, there should only be one.

The moral of the story is, if I want my data to be different, I should modify
it in the method that goes about collecting the data, not the one the method
that filters the data, or that uses it for some other operation.

POST-SOLUTION RE FURTHER EXPLORATION

So I didn't read the question carefully enough to notice that it only wanted
alphanumeric characters, I had taken it to be only alphabetic characters.

Then I went through this learning process to suggest, if you want to modify your
data, it is most appropriate to do so in the data collection stage, but I just
read somebody elses Further Exploration, and they weren't confined in this way.
They had designed their palindromes method so that the original data could
still contain non alpha-numeric characters, but that a list of palindromes
wouldn't include any substrings with non-alphanumeric characters.

I'm continuing to realise that I didn't really read the further exploration
carefully enough. I think I sometimes will gloss through the question, and
intuit what the question is asking of me. In this instance, the question
didn't go far into specifics, just asking how the code might be written such
that non-alphanumeric characters were ignored. When I saw ignored, the way I
processed what the question was asking was actually that non-alphanumeric
characters should be excluded.
These two things are different.
If we exclude non-alphanumerics, we'll likely want palindromes that contains
no non-alphanumerics.
If we ignore non-alphanumeris, we'll  likely want to discount these characters
when determining whether a string is a palindrome or not.

Having reread and pondered the question so many times, I've ended up solving
the problem simply by inserting the following into my palindrome loop:

substr = substr.delete("^a-zA-Z")

=end