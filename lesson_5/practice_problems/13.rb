arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end.tap { |result| p result }

# odd_nums = []
# sub_arr.each do |num|
#   odd_nums << num if num.odd?
# end
# odd_nums

