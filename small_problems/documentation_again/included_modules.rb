a = [5, 9, 3, 11]
puts a.min(2)

# When this exercise was written, the #min method belonged to the Enumerable
# module, the point of the exercise may have been to demonstrate the usage of a
# method on a class where it is not listed on the classes doc page (or on the
# superclass page?)

# In Ruby 2.4.0, an Array#min method was added, but the enumerable method
# remains? The two entries are almost identical, with only one additional
# example tagged onto the end of a set displayed in the Enumerable page - this
# method is still applicable to Array#min.

# Does this one additional example somehow highlight the necessity to include a
# differentiated Array#min method?
# Perhaps Array was given it's own method because it is a method that is part
# the regular Array lexicon, such that it deserves a place on the Array doc
# page? I wouldn't lean to heavily on that idea. And question of why the
# example in Enumerable#min is ommitted from Array#min.