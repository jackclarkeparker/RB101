def oddities(array)
  even_index_array = []    #Post solution <-- odd_elements is a good name for this array

  array.each_with_index do |element, i|
    even_index_array.push(element) if i.even?
  end
  even_index_array
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

# Further Exploration

def even_stevens(array)
  odd_index_array = []

  array.each_with_index do |element, i|
    odd_index_array.push(element) if i.odd?
  end
  odd_index_array
end

p even_stevens([2, 3, 4, 5, 6]) == [3, 5]
p even_stevens([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p even_stevens(['abc', 'def']) == ['def']
p even_stevens([123]) == []
p even_stevens([]) == []

def oddities_2(array)
  odd_elements = []
  even_index = true

  array.each do |element|
    odd_elements << element if even_index
    even_index = !even_index
  end
  odd_elements
end

def oddities_3(array)
  odd_elements = []

  until array.empty?
    odd_elements << array.first
    array = array.drop(2)
  end
  odd_elements
end