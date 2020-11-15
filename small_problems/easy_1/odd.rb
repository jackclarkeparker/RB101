# Pre-solution

# def is_odd?(int)
#   if int % 2 == 0
#     false
#   else
#     true
#   end
# end

# puts is_odd?(2)
# puts is_odd?(-3)
# puts is_odd?(0)
# puts is_odd?(5)
# puts is_odd?(-8)

# Post-solution
#
# I'd not thought of the fact that equality operators return a boolean value
# themselves. The solution uses just one line of code to determine whether to
# return true or false. It's been a while!

# def is_odd?(int)
#   int % 2 == 1
# end