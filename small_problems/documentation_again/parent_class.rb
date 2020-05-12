s = 'abc'
puts s.public_methods(false).inspect

# By supplying keyword false, we change the default value of the `all`
# parameter such that only the methods directly available to the
# receiver are returned.