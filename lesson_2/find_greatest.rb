def find_greatest(numbers)
  saved_number = nil

  numbers.each do |num|
    saved_number ||= num
    if saved_number >= num
      next
    else
      saved_number = num
    end
  end

  saved_number
end

def prompt(message)
  puts "=> #{message}"
end

prompt "Welcome. Let's find the greatest number!"
sleep 0.8
prompt "Please enter each number you'd like to include in your collection"
sleep 1.4
prompt "Remember, delimit with spaces and hit return when all numbers are
entered!"

array = gets.chomp.split.map(&:to_i)
return nil if array.nil?

prompt "the greatest number in your collection is..."
sleep 1
prompt find_greatest(array).to_s + "!"