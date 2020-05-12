1. puts Date.new                #4712-01-01
2. puts Date.new(2016)          #2016-01-01
3. puts Date.new(2016, 05)      #2016-05-01
4. puts Date.new(2016, 05, 13)  #2016-05-13


# When you call ::new on a class it creates a new object/instance of that
# class.

# Without providing any arguments, Date.new returns the default instance of
# Date which is -4712-01-01

# Date::new can also be provided with arguments. The first will be assigned to
# the year, the second the month, and the third the date. Any divisions of time
# that are unassigned will be assigned to the corresponding value found in the
# default instance.