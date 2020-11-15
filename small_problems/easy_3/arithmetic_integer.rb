def prompt(message)
  puts "==> #{message}"
end

numbers = []
operators = [:+, :-, :*, :/, :%, :**]

prompt "Enter the first number:"
numbers << gets.chomp.to_i
prompt "Enter the second number:"
numbers << gets.chomp.to_i

operators.each do |op|
  prompt "#{numbers[0]} #{op} #{numbers[1]} = #{numbers.reduce(op)}"
end
