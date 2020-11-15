require 'yaml'

STARTING_DECK = [
  2, 2, 2, 2,
  3, 3, 3, 3,
  4, 4, 4, 4,
  5, 5, 5, 5,
  6, 6, 6, 6,
  7, 7, 7, 7,
  8, 8, 8, 8,
  9, 9, 9, 9,
  10, 10, 10, 10,
  'Jack', 'Jack', 'Jack', 'Jack',
  'Queen', 'Queen', 'Queen', 'Queen',
  'King', 'King', 'King', 'King',
  'Ace', 'Ace', 'Ace', 'Ace'
]
BUST_LIMIT = 21
STAY_THRESHOLD = BUST_LIMIT - 4
MESSAGES = YAML.load_file("21_messages.yml")

def prompt(message)
  puts "=> #{message}"
end

def display_intro
  puts "WELCOME TO #{BUST_LIMIT}!".center(80)
  sleep(2)
  puts "\n"
  prompt MESSAGES['rules']
  prompt MESSAGES['continue']
  display_rules if show_rules?
end

def show_rules?
  answer = ''
  loop do
    answer = gets.chomp.downcase
    break if %w(r rules c continue).include?(answer)
    prompt MESSAGES['invalid_input_rules_1']
    prompt MESSAGES['invalid_input_rules_2']
  end
  sleep(0.8)
  answer.start_with?('r')
end

# rubocop:disable Metrics/AbcSize
def display_rules
  prompt MESSAGES['rules_1']
  sleep(0.8)
  prompt "If a competitor goes over #{BUST_LIMIT}, they are bust."
  puts MESSAGES['rules_2']
  sleep(2)
  prompt MESSAGES['rules_3']
  sleep(2)
  prompt MESSAGES['rules_4']
  sleep(2)
  prompt MESSAGES['rules_5']
  sleep(1)
  prompt MESSAGES['rules_6']
  gets
end
# rubocop:enable Metrics/AbcSize

def deal_hand
  system('clear')
  puts "Dealing...".center(80)
  deck = STARTING_DECK.dup.shuffle!
  player_hand = []
  dealer_hand = []

  2.times do
    deal_card(player_hand, deck)
    deal_card(dealer_hand, deck)
  end
  sleep(2)

  [player_hand, dealer_hand, deck]
end

def deal_card(hand, deck)
  hand << deck.pop
end

# rubocop:disable Metrics/AbcSize
def display_hands(player_hand, dealer_hand, players_turn: true)
  system('clear')
  if players_turn
    puts "PLAYER'S TURN".center(80)
    puts "\nDealer's hand: #{dealer_hand[0]} and an unknown card"
  else
    puts "DEALER'S TURN".center(80)
    puts "\nDealer's hand: #{dealer_hand[0..-2].join(', ')}"\
          " and #{dealer_hand.last} -> score: #{hand_score(dealer_hand)} "
  end
  puts "Player's hand: #{player_hand[0..-2].join(', ')} and "\
       "#{player_hand.last} -> score: #{hand_score(player_hand)}"
  puts "\n\n"
  sleep(0.6)
end
# rubocop:enable Metrics/AbcSize

def player_turn(player_hand, dealer_hand, deck)
  display_hands(player_hand, dealer_hand)
  sleep(0.5)
  loop do
    player_move = hit_or_stay
    if %w(h hit).include?(player_move)
      prompt "You chose to hit!"
      sleep(0.5)
      deal_card(player_hand, deck)
      display_hands(player_hand, dealer_hand)
      break if busted?(hand_score(player_hand))
    else
      prompt "You chose to stay with a total of #{hand_score(player_hand)}!"
      break sleep(1)
    end
  end
end

def hit_or_stay
  loop do
    prompt MESSAGES['hit_or_stay']
    answer = gets.chomp.downcase
    break answer if %w(h hit s stay).include?(answer)
    prompt MESSAGES['invalid_input_hit_or_stay_1']
    prompt MESSAGES['invalid_input_hit_or_stay_2']
  end
end

def busted?(score)
  score > BUST_LIMIT
end

def hand_score(hand)
  values_hand = hand.dup
  values_hand.map! { |card| %w(Jack Queen King).include?(card) ? 10 : card }
  calculate_aces(values_hand).sum
end

def calculate_aces(hand)
  number_of_aces = hand.count('Ace')
  ace_value_distribution = [11] * number_of_aces
  hand.delete('Ace')

  number_of_aces.times do |index|
    break if hand.sum + ace_value_distribution.sum <= BUST_LIMIT
    ace_value_distribution[index] = 1
  end
  hand.concat(ace_value_distribution)
end

def dealer_turn(player_hand, dealer_hand, deck)
  loop do
    display_hands(player_hand, dealer_hand, players_turn: false)
    if hand_score(dealer_hand) < STAY_THRESHOLD
      prompt "Dealer Hits!"
      sleep(0.9)
      deal_card(dealer_hand, deck)
      display_hands(player_hand, dealer_hand, players_turn: false)
      break if busted?(hand_score(dealer_hand))
    else
      prompt "Dealer chose to stay with a total of #{hand_score(dealer_hand)}!"
      sleep(1)
      break
    end
  end
end

# rubocop:disable Style/EmptyCaseCondition
def find_result(player_hand, dealer_hand)
  player_score = hand_score(player_hand)
  dealer_score = hand_score(dealer_hand)
  totals = "\n\nDealer's hand: #{dealer_hand} --> score: #{dealer_score}"\
           "\n\nPlayer's hand: #{player_hand} --> score: #{player_score}"
  outcome = case
            when player_score > BUST_LIMIT
              :player_bust
            when dealer_score > BUST_LIMIT
              :dealer_bust
            when player_score > dealer_score
              :player_wins
            when dealer_score > player_score
              :dealer_wins
            end
  [totals, outcome]
end
# rubocop:enable Style/EmptyCaseCondition

def display_result(totals, outcome, score_board)
  system('clear')
  puts "–––– Round Results ––––"
  puts totals + "\n\n"
  sleep(2)
  prompt outcome_message(outcome)
  sleep(1)
  display_score(score_board)
end

def outcome_message(outcome)
  case outcome
  when :player_bust then MESSAGES['player_bust']
  when :dealer_bust then MESSAGES['dealer_bust']
  when :player_wins then MESSAGES['player_wins']
  when :dealer_wins then MESSAGES['dealer_wins']
  else
    MESSAGES['tie']
  end
end

def update_score_tally(score_board, outcome)
  case outcome
  when :player_bust
    score_board[:player] -= 100
  when :dealer_bust
    score_board[:dealer] -= 200
  when :player_wins
    score_board[:player] += 200
  when :dealer_wins
    score_board[:dealer] += 200
  end
end

def display_score(score_board)
  puts "// // SCORE TALLY \\\\ \\\\"
  puts "\n"
  prompt "Dealer: #{score_board[:dealer]}"
  prompt "Player: #{score_board[:player]}\n\n"
  sleep(2)
end

def display_grand_winner(score_board)
  system('clear')
  winning_score = score_board.values.max
  grand_winner = score_board.key(winning_score)
  prompt "With a final score of #{winning_score}.."
  sleep(1)
  prompt "The Grand Winner is...."
  sleep(1)
  grand_winner_sequence(grand_winner)
end

def grand_winner_sequence(grand_winner)
  system('clear')
  reprints = 12
  whitespace_gap = ' ' * grand_winner.length
  (0...reprints).each do |line|
    puts (whitespace_gap * line) + grand_winner.upcase.to_s
    sleep(0.075)
  end
  reprints.downto(0) do |line|
    puts (whitespace_gap * line) + grand_winner.upcase.to_s
    sleep(0.075)
  end
end

def play_again?
  answer = ''
  puts "\n"
  loop do
    prompt MESSAGES['play_again']
    answer = gets.chomp.downcase
    break if %w(y yes n no).include?(answer)
    prompt MESSAGES['invalid_input_play_again_1']
    prompt MESSAGES['invalid_input_play_again_2']
    sleep(1.2)
  end
  answer.start_with?('y')
end

### MAIN GAME LOOP
system('clear')
display_intro
loop do
  system('clear')
  score_board = { player: 0, dealer: 0 }
  loop do
    player_hand, dealer_hand, deck = deal_hand
    player_turn(player_hand, dealer_hand, deck)
    unless busted?(hand_score(player_hand))
      dealer_turn(player_hand, dealer_hand, deck)
    end

    totals, outcome = find_result(player_hand, dealer_hand)
    update_score_tally(score_board, outcome)
    display_result(totals, outcome, score_board)
    break if (score_board.values.min <= -500) || (score_board.values.max >= 500)
  end
  display_grand_winner(score_board)
  break unless play_again?
end

prompt MESSAGES['goodbye']
sleep(1)
system('clear')
