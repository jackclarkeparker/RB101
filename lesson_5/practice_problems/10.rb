arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
p arr

incremented_values = arr.map do |sub_hsh|
  sub_hsh.each_key do |key|
    sub_hsh[key] += 1
  end
end

p incremented_values

# They did basically the same thing as I did, but instead of incrementing the
# value for sub_hsh, they set the value for a new structure - incrememented_hash
# I modified the data structure I was working on. From here on, I'll avoid things
# that smell like this. I wasn't totally sure whether I was modifying the array or
# not, or if it counted if I wasn't appending/deleting items from the array
# structure, but I guess it's best to just avoid it like the plague. It's very
# simple to instead assign these values to a new structure instead.

# It's like taking your driver's licence! Code as though you are proving you are
# a safe driver. Take note of the rules, give way, etc etc.

# When they do it their way, they use each because they use both key and value.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr.map do |hsh|
  incrememented_hash = {}
  hsh.each_pair do |key, value|
    incrememented_hash[key] = value + 1
  end
  incrememented_hash
end.tap { |result| p result }
