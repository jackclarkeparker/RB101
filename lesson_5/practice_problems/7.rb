# a = 2
# b = [5, 8]
# arr = [a, b]

# arr[0] += 2
# arr[1][0] -= a

# a will be 2
# b will be [3, 8]
# arr will be [4, [3, 8]]

# The increment on line 5 destructively modifies arr as a setter method, but it
# has no effect on the existing `a` object within arr, instead the element is
# reassigned to a value 2 greater - 4.

# The decrement on line 6 is a setter method not only for arr, but also for the
# array `b`, both are destructively modified.

# NOTE: There is no way to destructively modify `a` - it is an integer, and
# integers are immutable.