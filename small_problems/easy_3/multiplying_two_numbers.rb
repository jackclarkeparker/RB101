def integer?(number)
  number.to_i.to_s == number
end

def float?(number)
  number.to_f.to_s == number
end

def strings_to_numbers(arguments)
  arguments.map! do |number|
    if integer?(number)
      number.to_i
    elsif float?(number)
      number.to_f
    end
    number
  end
end

def invalid_arguments?(arguments)
  too_many_strings = arguments.all? { |arg| arg.is_a? String }
  string_and_float = (arguments.any? { |arg| arg.is_a? String }) &&
                     (arguments.any? { |arg| arg.is_a? Float })

  if too_many_strings
    puts "\nSorry, this method needs at least one numeric argument."
    true
  elsif string_and_float
    puts "\nSorry, can only multiply a String with an Integer, not a Float."
    true
  end
end

def array_order(array)
  array.each_with_index do |arg, i|
    array.insert(1, array.delete_at(i)) if arg.is_a? Integer
  end
end

def multiply(arg1, arg2)
  arguments = [arg1, arg2]

  arguments = strings_to_numbers(arguments)
  return if invalid_arguments?(arguments)
  arguments = array_order(arguments)

  arguments[0] * arguments[1]
end

def square(n)
  multiply(n, n)
end

puts multiply("3.5", 2) == 7

puts square("3.5")