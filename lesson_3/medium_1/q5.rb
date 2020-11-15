=begin
The problem with the fib method is that it doesn't pass in the limit variable,
and when a reference is made to limit within the method, it pulls up a
NameError. Just slip in a parameter for limit, and invoke with the variable.
=end

limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"
