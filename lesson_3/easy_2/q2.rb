munsters_description = "The Munsters are creepy in a good way."

arr = munsters_description.split
arr[0..1].map!(&:swapcase!)
arr[2..].map!(&:upcase!)
p arr.join " "
p munsters_description.capitalize
p munsters_description.downcase
p munsters_description.upcase

# Post-Solution

# Wah! I made it complicated. I thought that the first string was a result of
# more than one case manipulation, didn't see that all the upcase chars were
# just another result of swapcase!

# I also refrained from reassigning munsters_description to my arr.join call
# This because I saw how it would make the other methods cease to work properly
# I didn't then go the extra step of realising that I could simply turn each of
# them into their destructive versions for more legible code that would function
# regardless of the reassignment away from the original string.

munsters_description = "The Munsters are creepy in a good way."

p munsters_description.swapcase!
p munsters_description.capitalize!
p munsters_description.downcase!
p munsters_description.upcase!