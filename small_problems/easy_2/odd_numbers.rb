array = (1..99).to_a
array.select!(&:odd?)
array.each { |number| puts number }

# Post-Solution
# There is an Enumberable#select method which can be called directly on a
# range, hence, the first line of code is unnecessary.