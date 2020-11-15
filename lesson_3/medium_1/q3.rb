def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

=begin
  BONUS 1
number % divisor == 0 determines that the divisor leaves no remainder, dividing
evenly into the number, thereby proving that it is a factor. This iteration of
the divisor will only be assigned in a later iteration.

  BONUS 2
It's important to cite the factors array before the end of the method so that
it can be implicitly returned, and made available to assign to a variable
outside the method definition, and handled elsewhere in the program