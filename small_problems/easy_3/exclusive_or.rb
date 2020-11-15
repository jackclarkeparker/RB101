def xor? (boolean_1, boolean_2)
  if (boolean_1 && boolean_2) || (!boolean_1 && !boolean_2)
    false
  else
    true
  end
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# POST-SOLUTION
# There's a neat way of creating this operator which is more idiomatic Ruby, it
# doesn't require the use of any conditional, and automatically returns a
# boolean object without requiring you to provide one explicitly:

# def xor?(value1, value2)
#   !!((value! && !value2) || (value2 && !value1))
# end

# The double not operator !! is not a new separate operator. Using ! twice
# negates it's negating effect.

# ^ is a bit-wise operator which can perform exclusive-or bit operations.
# The only issue with ^ is that it only works when both values are numeric,
# or both are boolean -- anything else may lead to unexpected results.