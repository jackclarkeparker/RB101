advice = "Few things in life are as important as house training your pet dinosaur."
advice.include? "Dino"

=begin
  Post-Solution

The provided solution makes use of String#match? which is a more powerful method
than #inlude? In this use case they are the same, but #match? has two additional
benefits, one is that you cans search the string for a match with a regexp, not
just a string. This gives us a whole lot more flexibility when searching a string
for whether it meets our criteria.

The second benefit is that match? has an optional second argument where we can
provide the index from which to begin our search through the string for a match.

=end