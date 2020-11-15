def running_total(array)
  running_totals_array = []

  array.each_index { |i| running_totals_array << array[0..i].sum }

  running_totals_array
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# Post-Solution
# Realised I've gotta space my code out a bit for readability after looking at some other code


def running_total(array)
  running_totals_array = []

  array.each_index { |i| running_totals_array << array[0..i].sum }

  running_totals_array
end

# Also looking at my code and seeing that the dense processing step is not very clear.

def running_total(array)
  running_totals_array = []

  array.each_index do |i|
    running_totals_array << array[0..i].sum
  end

  running_totals_array
end


# Further Exploration

def running_total(array)
  array.each_with_object([]) do |num, arr|
    if arr.empty?
      arr << num
    else
      arr << (num + arr.last)
    end
  end
end

def running_total(array)
  running_totals_array = []
  array.each_index { |i| running_totals_array << array[0..i].inject(0, :+) }   
  running_totals_array
end
