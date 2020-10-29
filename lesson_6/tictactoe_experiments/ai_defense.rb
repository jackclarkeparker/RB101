=begin

Aim:

The computer currently picks a square at random. That's not very interesting.
Let's make the computer defensive minded, so that if there's an immediate
threat, then it will defend the 3rd square. We'll consider an "immediate threat"
to be 2 squares marked by the opponent in a row. If there's no immediate threat,
then it will just pick a random square.

Questions:
  - Do the square have to be consecutively in a row? i.e. can they be in a row,
    but with a gap between them?
    - They still represent an immediate threat because the player only needs to
      make one move to complete their row.
  A They can be in a row with a gap between
  - 
  - What will the computer do if doubled trapped?
    - defend against the first immediate threat that it finds?
  A (I'm imagining it could depend on the implementation, but doesn't really matter
     so long as it defends against one of them)
  - 

Rules
    - Output: Computer move
### EXPLICIT:
    - Input: Hash
    * board state
    * The computer will play defensively if it's opponent has constructed an immediate threat
    * If there is no immediate threat, the computer picks a random square
    - 
    - 

### IMPLICIT:
    - When the player has 2 out of three of the squares from a winning combination,
      this is considered an "immediate threat"
      - an addition to this rule is that it only applies if the remaining square is empty.
    - 

Examples:

     |     |     
  X  |  X  |     
     |     |     
-----+-----+-----
     |     |     
  O  |     |     
     |     |     
-----+-----+-----
     |     |     
     |     |     
     |     |     

computer will place it's marker in square 3 to defend against immediate threat
of [1, 2, 3] winning combination by player.



     |     |     
  X  |     |     
     |     |     
-----+-----+-----
     |     |     
  O  |     |     
     |     |     
-----+-----+-----
     |     |     
     |     |  X  
     |     |     

computer will place it's marker in square 5 to defend against immediate threat
of [1, 5, 9] winning combination by player.



     |     |     
  X  |     |     
     |     |     
-----+-----+-----
     |     |     
     |     |     
     |     |     
-----+-----+-----
     |     |     
  X  |  O  |  X  
     |     |     

Computer will place it's marker on 4 or 5, and of those, I suppose it will place
it's marker on 4.


Data Structure:
 - Hash input will contain the current board state
 - Array of arrays contains the WINNING_LINES
 - Need to detect whether any 2 squares that the player has marked match up
   with any of the winning combinations in WINNING_LINES and if the reamining square
   for the line is empty. In this case, the computer needs to place it's marker
   defensively.

Algorithm

Input: Hash

1# Test all two square combinations of the player against the WINNING LINES combos

2# Test all WINNING LINES combos to see whether they contain two squares marked by
the player

2 seems better

 1. Find possible threats
    - Iterate through WINNING_LINES
      - search for any lines that have 2 of their squares populated by player_marker
        - If you find a line where this is the case, determine whether the
          remaining square is empty.
          - If yes, this is an immediate threat, place a marker in it.
          - If no, this is not an immediate threat, continue iteration.
 2. If no threats are detected after iteration, pick a random square.
 3. 
 4. 
 5. 

Output: Computer move

=end










require 'pry'
require 'pry-byebug'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(message)
  puts "=> #{message}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, card)
  system 'clear'
  puts "Player score: #{card[:player]}"
  puts "Computer score: #{card[:computer]}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def display_winner(board, card)
  case detect_winner(board)
  when "Player"
    prompt "Player won!"
    sleep(1.2)
    card[:player] += 1
  when "Computer"
    prompt "Computer won!"
    sleep(1.2)
    card[:computer] += 1
  else
    prompt "It's a tie!"
  end
end

def display_reel(board, card)
  display_board(board, card)
  display_winner(board, card)
end

def display_grandwinner(card)
  puts "The grandwinner is..."
  sleep(0.8)
  puts "."
  sleep(0.4)
  puts "."
  sleep(0.65)
  puts "."
  sleep(0.9)
  system('clear')
  puts "The #{card.key(5)}!!!".upcase
  sleep(1.4)
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(array, separator = ', ', word = 'or')
  unless array.length > 2
    return array.join(" #{word} ")
  end

  array.insert(-2, word)
  last_element = array.pop
  array.join(separator) + " #{last_element}"
end

def player_places_piece!(brd)
  square = ''
  prompt "Choose a square: #{joinor(empty_squares(brd))}"
  puts "\n\nPlayer marker - #{PLAYER_MARKER}\nComputer Marker - #{COMPUTER_MARKER}\n\n"
  loop do
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = ai_defense(brd)
  square ||= empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def ai_defense(brd)
  WINNING_LINES.each do |line|
    line_values = brd.values_at(*line).tally
    if line_values[PLAYER_MARKER] == 2 && line_values[INITIAL_MARKER] == 1
      return line.find { |square| brd[square] == INITIAL_MARKER }
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

loop do
  score_card = { player: 0, computer: 0 }

  loop do
    board = initialize_board

    loop do
      display_board(board, score_card)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_reel(board, score_card)

    break if score_card.any? { |_, score| score >= 5 }
  end

  display_grandwinner(score_card)

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"

=begin

___Lingering Questions___
 1. 
 2. 
 3. 

# POST-SOLUTION

___First thoughts___
 - The name of my method is ai defense. It doesn't explain how it is operating.
   - This means that you have to take a look at the implementation every time that you run the code.
 - 
 - 

___Mental Model Modifications___
 - 
 - 

# FURTHER EXPLORATION

Aim:



Questions:
 - 
 - 
 - 
 - 

  Rules
   - Input: 
   * 
   - Output: 
   * 
   - 
   - 
   - 

Examples:



Algorithm
 1. 
 2. 
 3. 
 4. 
 5. 

=end


