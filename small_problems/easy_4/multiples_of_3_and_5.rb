def fetch_multiples(limit, fundamental)
  multiples = []
  fundamental.step(limit, fundamental) { |n| multiples << n }
  multiples
end

def multisum(limit)
  multiples_of_three = fetch_multiples(limit, 3)
  multiples_of_five = fetch_multiples(limit, 5)

  all_multiples = (multiples_of_three + multiples_of_five).uniq
  all_multiples.reduce(0, :+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

# Post-Solution

# Use #to_a! Makes it much easier