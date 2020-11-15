INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
CHOOSE = 'Choose'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def display_intro_sequence
  display_intro_top_and_bottom
  display_intro_middle
  display_intro_title
  display_intro_middle
  display_intro_top_and_bottom
  sleep(2)
  system('clear')
end

def display_intro_top_and_bottom
  10.times do
    symbol = ["XXXOOO", "OOOXXX"].sample
    13.times do
      print symbol
      sleep(0.003)
    end
    puts ""
  end
end

# rubocop:disable Lint/ParenthesesAsGroupedExpression
def display_intro_middle
  5.times do
    symbol = ["XXXOOO", "OOOXXX"].sample
    puts (symbol * 4) + (" " * 30) + (symbol * 4)
    sleep(0.010)
  end
end
# rubocop:enable Lint/ParenthesesAsGroupedExpression

def display_intro_title
  symbol = ["XXXOOO", "OOOXXX"].sample
  puts "Welcome to Tic Tac Toe!".center(30).center(78, symbol)
end

def prompt(message)
  puts "=> #{message}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, card)
  system 'clear'
  display_scores(card)
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

def display_scores(card)
  puts "Player score: #{card['Player']}"
  puts "Computer score: #{card['Computer']}"
end

def display_winner(winner)
  if winner
    prompt "#{winner} won!"
    sleep(1.2)
  else
    prompt "It's a tie!"
    sleep(1.2)
  end
end

def display_grandwinner(card)
  system('clear')
  puts "The grandwinner is..."
  sleep(0.8)
  puts "."
  sleep(0.4)
  puts "."
  sleep(0.65)
  puts "."
  sleep(0.9)
  system('clear')
  display_winner_cascade(card)
end

def display_winner_cascade(card)
  winner = "THE #{card.key(5)}!!! ".upcase
  (1..4).each do |column|
    70.times do
      puts winner * column
      sleep(0.005)
    end
  end
  sleep(1.5)
  system('clear')
end

def display_markers_key
  puts "\n\nPlayer marker - #{PLAYER_MARKER}"
  puts "Computer Marker - #{COMPUTER_MARKER}\n\n"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def find_starting_player
  case CHOOSE
  when 'Choose'
    choose_starting_player
  when 'Player'
    'Player'
  when 'Computer'
    'Computer'
  end
end

def choose_starting_player
  loop do
    display_starting_player_sequence
    answer = gets.chomp

    if answer == 'p'
      sleep(0.9)
      break 'Player'
    elsif answer == 'c'
      sleep(0.9)
      break 'Computer'
    else
      puts "\n\nSorry, that's not a valid input. Please make try again."
      sleep(1.4)
      system('clear')
    end
  end
end

def display_starting_player_sequence
  puts ""
  puts "Who goes first?".center(80)
  sleep(0.6)
  puts ""
  puts "Enter 'p' for Player, or 'c' for Computer".center(80)
end

def player_places_piece!(brd)
  square = ''
  prompt "Choose a square: #{joinor(empty_squares(brd))}"
  display_markers_key
  loop do
    square = gets.chomp

    if valid_integer?(square) && empty_squares(brd).include?(square.to_i)
      square = square.to_i
      break
    else
      prompt "Sorry, that's not a valid choice. Please try again."
    end
  end
  brd[square] = PLAYER_MARKER
end

def joinor(array, separator = ', ', word = 'or')
  unless array.length > 2
    return array.join(" #{word} ")
  end

  array.insert(-2, word)
  last_element = array.pop
  array.join(separator) + " #{last_element}"
end

def valid_integer?(num)
  num.to_i.to_s == num
end

def computer_places_piece!(brd)
  square = find_offensive_or_defensive_move(brd)

  if !square && brd[5] == INITIAL_MARKER
    square = 5
  end

  square ||= empty_squares(brd).sample

  brd[square] = COMPUTER_MARKER
end

def find_offensive_or_defensive_move(brd)
  sqr = nil
  [COMPUTER_MARKER, PLAYER_MARKER].each do |marker|
    WINNING_LINES.each do |line|
      sqr = find_at_risk_square(line, brd, marker)
      return sqr if sqr
    end
  end
  nil
end

# rubocop:disable Style/EmptyElse
def find_at_risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    line.find { |sqr| brd[sqr] == INITIAL_MARKER }
  else
    nil
  end
end
# rubocop:enable Style/EmptyElse

def place_piece!(brd, current_player)
  case current_player
  when 'Player'
    player_places_piece!(brd)
  when 'Computer'
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  current_player == 'Player' ? 'Computer' : 'Player'
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
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

def update_score(winner, card)
  card[winner] += 1 if winner
end

def overall_winner?(card)
  card.any? { |_, score| score >= 5 }
end

def play_again?
  answer = ''

  loop do
    prompt "Play again? (y or n)"
    answer = gets.chomp.downcase
    if %w(yes no y n).include?(answer)
      break
    else
      prompt "Sorry, that wasn't a valid input. Please try again."
      sleep(0.9)
      system('clear')
    end
  end

  answer.start_with?('y')
end

## MAIN GAME LOOP STARTS HERE

system('clear')
display_intro_sequence
loop do
  score_card = { 'Player' => 0, 'Computer' => 0 }
  starting_player = find_starting_player

  loop do
    board = initialize_board
    current_player = starting_player

    loop do
      display_board(board, score_card)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, score_card)
    winner = detect_winner(board)
    display_winner(winner)
    update_score(winner, score_card)

    break if overall_winner?(score_card)
  end

  display_grandwinner(score_card)

  break unless play_again?
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
sleep(0.8)
system('clear')
