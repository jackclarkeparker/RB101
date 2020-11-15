def prompt(message)
  puts "==> #{message}"
end

def number_with_suffix(number)
  if (number.slice(-1).between?('4', '9')) ||
     ((number.length > 1) && number.slice(-2, 2).between?('11', '13')) ||
     (number.end_with?('0'))
    number + "th"
  else
    suffix = { '1' => "st", '2' => "nd", '3' => "rd" }[number.slice(-1)]
    number + suffix
  end
end

def display_number_prompt(number)
  if valid_number?(number)
    prompt("Enter the #{number_with_suffix(number)} number:")
  else
    prompt("Enter the #{number} number:")
  end
end

def float?(number)
  number.to_f.to_s == number
end

def integer?(number)
  number.to_i.to_s == number
end

def valid_number?(number)
  float?(number) || integer?(number)
end

def input_loop
  input = ""
  loop do
    input = gets.strip
    if valid_number?(input)
      break input
    else
      prompt "INVALID INPUT \n Please limit input to digits, decimal "\
      "points, and unary minus (\"-\" for -ve's) only."
    end
  end
end

def store_input_numbers(first_numbers)
  first_numbers.push(input_loop)
end

def destringify(array)
  array.map! do |number|
    if float?(number)
      number.to_f
    else
      number.to_i
    end
  end
end

first_numbers = []

("1".."5").each do |i|
  display_number_prompt(i)
  store_input_numbers(first_numbers)
end

display_number_prompt("last")
final_input = input_loop

if first_numbers.include?(final_input)
  prompt "The number #{final_input} appears in #{destringify(first_numbers)}."
else
  prompt "The number #{final_input} doesn't appear in "\
  "#{destringify(first_numbers)}."
end
