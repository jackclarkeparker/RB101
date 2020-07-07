# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# input = Kernel.gets()
# Kernel.puts(input)

def prompt(message)
  Kernel.puts "=> #{message}"
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def number?(num)
  integer?(num) || float?(num)
end

def operation_to_message(op)
  op_message = case op
               when '1' then 'Adding'
               when '2' then 'Subtracting'
               when '3' then 'Multiplying'
               when '4' then 'Dividing'
               end

  op_message
end

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
puts MESSAGES

prompt "Welcome to Calculator! Enter your name:"

name = ''
loop do
  name = Kernel.gets.chomp

  break if !name.empty?

  prompt "Make sure to use a valid name."
end

prompt "Hi #{name}"

loop do # Main loop
  number1 = ''
  loop do
    prompt "What's the first number?"
    number1 = Kernel.gets.strip

    if number? number1
      if number1.include?(".")
        number1 = number1.to_f
      else
        number1 = number1.to_i
      end
      break
    end

    prompt "Hmm... that doesn't look like a valid number."
  end

  number2 = ''
  loop do
    prompt "What's the second number?"
    number2 = Kernel.gets.strip

    if number? number2
      if number2.include?(".")
        number2 = number2.to_f
      else
        number2 = number2.to_i
      end
      break
    end

    prompt "Hmm... that doesn't look like a valid number."
  end

  operator_prompt = <<-MSG
What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt operator_prompt

  operator = ''
  loop do
    operator = Kernel.gets.strip

    break if %w(1 2 3 4).include?(operator)

    prompt("Must choose 1, 2, 3 or 4")
  end

  prompt "#{operation_to_message(operator)} the two numbers..."
  sleep 1

  result = case operator
           when '1' then number1 + number2
           when '2' then number1 - number2
           when '3' then number1 * number2
           when '4' then number1 / number2
           end

  prompt "The result is #{result}"
  sleep 0.8

  prompt "Do you want to perform another calculation? (Y to calculate again)"
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt "Thank you for using calculator. See you again!"
