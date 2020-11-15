def stringy(int)
  output = ""

  q, m = int.divmod(2)
  output = '1' if m == 1
  output.prepend('10' * q)
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(0) == ''