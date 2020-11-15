integer = nil
operator = nil

loop do
  puts ">> Please enter an integer greater than 0:"
  integer = gets.to_i
  break if integer > 0
  puts "Invalid input"
end

loop do
  puts ">> Enter 's' to cmpute the sum, 'p' to compute the product."
  operator = gets.chomp
  break if %w(p s).include? operator
  puts "Invalid input"
end

case operator
when 's'
  result = (1..integer).reduce(0, :+)
when 'p'
  result = (1..integer).reduce(1, :*)
end

puts "The product of the integers between 1 and #{integer} is #{result}."