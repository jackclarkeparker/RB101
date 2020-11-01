INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
CHOOSE = 'choose'
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
  puts "Player score: #{card[:player]}"
  puts "Computer score: #{card[:computer]}"
end

def display_winner(brd, card)
  case detect_winner(brd)
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
    sleep(1.2)
  end
end

def display_reel(brd, card)
  display_board(brd, card)
  display_winner(brd, card)
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

# rubocop:disable Style/For
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
# rubocop:enable Style/For

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
  when 'choose'
    choose_starting_player
  when 'player'
    'player'
  when 'computer'
    'computer'
  end
end

def choose_starting_player
  loop do
    display_starting_player_sequence
    answer = gets.chomp

    if answer == 'p'
      sleep(0.9)
      break 'player'
    elsif answer == 'c'
      sleep(0.9)
      break 'computer'
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
  puts "Enter 'p' for player, or 'c' for computer".center(80)
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
  WINNING_LINES.each do |line|
    sqr = find_at_risk_square(line, brd, COMPUTER_MARKER)
    return sqr if sqr
  end

  WINNING_LINES.each do |line|
    sqr = find_at_risk_square(line, brd, PLAYER_MARKER)
    return sqr if sqr
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
  when 'player'
    player_places_piece!(brd)
  when 'computer'
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  current_player == 'player' ? 'computer' : 'player'
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

  answer.start_with?('y') ? true : false
end

## MAIN GAME LOOP STARTS HERE

system('clear')
display_intro_sequence
loop do
  score_card = { player: 0, computer: 0 }
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

    display_reel(board, score_card)

    break if score_card.any? { |_, score| score >= 5 }
  end

  display_grandwinner(score_card)

  break unless play_again?
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
sleep(0.8)
system('clear')

# rubocop:disable Layout/LineLength
=begin

___Lingering Questions___
 1. Not sure whether it's a good idea to include score_card in the detect_winner method,
    because it seems to dilute detect_winner into two actions; figuring out who won, and
    tallying this into the scorecard. We've been told that it's best to keep your methods
    simple by confining them to one action each.
    - Would it be better to call a helper method from within detect_winner such as
      tally_score   ?
      - Thinking about this makes me realise that even if you do this, and make
        detect_winner a method that does one thing, you'd still have to pass in
        the extra arguments for the helper method: your method may only do one thing,
        but the arguments you pass in do more than one thing, which may be confusing,
        and the opposite of the simplicity we're trying to achieve when we say we make
        our methods to do one thing.
          - Maybe this is the reason there are those other types of variables,
            accessible in other scopes.
          - Maybe I can also resolve this by using some default values?
            - Don't think so.

 2. The name of my method is ai defense. It doesn't explain how it is operating.
   - This means that you have to take a look at the implementation every time that you run the code.

 3.

## Other thoughts

- This is something that I've seen before, but still, tripped up with. Not that
  it's immediately obvious. And I didn't have the full problem description that
  I was tackling, I was working with one portion of the bonus features. The point
  is more about a learning here, and obviously you don't pick everything up perfectly
  the first time through. LS's solutions point out that both the offensive and defensive
  mechanisms of the AI rely on the ability to find "At risk squares". Since they both
  do this, we can reuse this method with a different argument for whether it will
  check for an offensive opportunity or defensive opportunity.
  system that chooses

=end
# rubocop:enable Layout/LineLength
