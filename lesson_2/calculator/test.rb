def calculate
  prompt "Welcome to Calculator"
  prompt "Please enter your first number:"
  number1 = gets.chomp.to_i
  prompt "Please enter your second number:"
  number2 = gets.chomp.to_i

  puts [number1, number2].reduce(0, operator)
end

def operator
  prompt <<-MSG
  Which operation would you like to perform?
  1) Addition
  2) Subtraction
  3) Multiplication
  MSG
  operation = gets.chomp

  case operation
  when "1" then :+
  when "2" then :-
  when "3" then :*
  end
end

def prompt(message)
  puts "==> #{message}"
end
