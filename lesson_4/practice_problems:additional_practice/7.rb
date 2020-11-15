statement = "The Flintstones Rock"
p statement.chars.tally

# My solution was pretty quick and dirty. I'm kind of doing a bit of hack and
# slash with this. I was wondering how they managed to get their letters in
# alphabetical order, starting with uppercase -> lowercase.

# My solution also includes the number of occurances of whitespace ' '

# So, the reason that they had their solution in alphabetical order was that
# the letters were stored in the order that they came up from a letters array,
# which was itself constructed in alphabetical order.

# They populated a results hash which started empty, and was assigned a key/v
# pair any time that there was at least one of the letter.

# They found out whether there was at least one of the letter by calling count
# on the result of a scan invocation.