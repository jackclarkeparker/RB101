advice = "Few things in life are as important as house training your pet "\
"dinosaur."
p advice.slice!(0..(advice.index(' house')))
p advice

=begin

BONUS

If you use String#slice instead, the return value of line 3 is the same, but
the original advice object will be unchanged as the method isn't destructive

Post-Solution

The method also used String#index to find the index of 'house', but rather than
delimiting a range, it was simply used as a secondary argument dictating the
length of sub string to #slice! This shows that any time we want to remove the
beginning of a string up to a given index, we can use that index as the length
to be cut. In my solution I had to provide the range with an offset of one whitespace
seeking the index of ' house'. Alternatively I could have used ... rather than ..

=end