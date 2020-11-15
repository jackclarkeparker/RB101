=begin

Aim: Write a method that takes an array of strings, and returns an array of the
same string values, except with the vowels (a, e, i, o, u) removed.

  - input: Array
  - output: Array
  Rules
    - Input Array
      - String elements
    - Output Array
      - Same array, but without any vowels.
      - Same string values, doesn't specify objects.
        - I'll still return the same Array object.
    -
    -

Example:

remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
single string, all vowels removed.

remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
Caps or lowercase doesn't matter

remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
Where all characters in string are vowels, return empty string
y isn't a vowel

Algorithm
  - Instantiate VOWELS constant
  - transform array
    - remove any VOWELS from each element.
  - return array

=end

VOWELS = %w(a e i o u)

def remove_vowels(array)
  array.map! do |string|
    string.chars.delete_if { |char| VOWELS.include?(char.downcase) }.join
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

=begin

# POST-SOLUTION

Here's the solution:
=end

def remove_vowels(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end

=begin

I had thought about using String#delete with my constant, but it takes a string
argument, not an array. I made it work, but their solution is really a lot
simpler. Moral of the story is:

If I'm trying to delete from an object, I can look at the documentation for
<Class>#delete and if it doesn't fit in with the scheme I've generated in my
mind, maybe instead I can be malleable to the way the language has been
constructed.
In this case, String#delete really is simple. I was already invested in the
idea of using a VOWELS constant, so didn't really widen my lens to account for
this simple way of removing vowels.
