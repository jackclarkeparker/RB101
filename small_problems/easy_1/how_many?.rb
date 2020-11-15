#PRE-SOLUTION

def count_occurrences(ary)
  occurrences = Hash.new
  ary.uniq.each { |element| occurrences[element] = 0 }

  ary.each { |element| occurrences[element] += 1 }
  
  occurrences.each { |key, value| puts "#{key} => #{value}" }
end

vehicles_example = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
vehicles_1   = %w(car car truck car SUV motorcycle)
vehicles_2   = %w(Car car CAR CAR Car)
vehicles_3   = []
vehicles_4   = [23, 'car', 'carro', 23]
rando_lyrics = [%w(Hey Ho), %w(Hey Ho), "Lets", "go"]

count_occurrences(vehicles_example)
puts "~                  ~"
count_occurrences(vehicles_1)
puts "~                  ~"
count_occurrences(vehicles_2)
puts "~                  ~"
count_occurrences(vehicles_3)
puts "~                  ~"
count_occurrences(vehicles_4)
puts "~                  ~"
count_occurrences(rando_lyrics)

# POST-SOLUTION
# They skip the incrementing step in the solution, instead setting each element
# immediately equal to the array.count(element)