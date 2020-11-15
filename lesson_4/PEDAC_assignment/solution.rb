
def sum_even_num_row(row_number)
  rows = []
  start_integer = 2
  (1..row_number).each do |current_row_number|
    rows << create_row(start_integer , current_row_number )
    start_integer = rows.last.last + 2
  end 
  rows.last.sum
end

def create_row(start_integer, row_length)
  row = []
  current_integer = start_integer
  until row.length == row_length
    row << current_integer
    current_integer += 2
  end
  row
end

# Start the Loop
#   - Add the start integer to the row
#   - Increment the start integer by 2
#   - Break out of the loop if length of row == row_length

# row_number: 1 --> sum of integers in row: 2
# row_number: 2 --> sum of integers in row: 10
# row_number: 4 --> sum of integers in row: 68

p sum_even_num_row(1) == 2  # true
p sum_even_num_row(2) == 10 # true
p sum_even_num_row(4) == 68 # true

# start: 2, length: 1 --> [2]
# start: 4, length: 2 --> [4, 6]
# start: 8, length: 3 --> [8, 10, 12]

# p create_row(2, 1) == [2] # true
# p create_row(4, 2) == [4, 6] # true
# p create_row(8, 3) == [8, 10, 12] # true

=begin
## Final Thoughts

PEDAC is not a completely linear process
Be prepared to move back and forward between the steps
  - When you're first approaching the problem, you'll want to start with the
    first step, but as you're moving further through PEDAC, there will be many
    situations where you'll want to refer back to your rules, and work with
    visual structures that you've generated at earlier stages in your problem.
  - At the algorithm stage, you may come across new parts of the problem whose
    rules you'll want to define separately.