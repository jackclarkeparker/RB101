ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.include?("Spot")

ages.any? { |k, v| k == "Spot" }

# After looking through documentation, realise that
#   1. Hash#include? exists (I thought I was using the Enumberable#include? method)
#   2. I'd forgotten about Hash#has_key? from the first course.
#   3. There a plethora of Hash#has_key? aliases - key?, member?, include?

# (I think 3. is what the question was aiming for me to understand)

ages.has_key?("Spot")
ages.key?("Spot")
ages.member?("Spot")