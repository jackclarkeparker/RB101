require 'yaml'

MESSAGES = YAML.load_file("rock_paper_scissors_messages.yml")
VALID_CHOICES = %w(rock paper scissors spock lizard)
CODE_FOR_MOVE = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'sp' => 'spock',
  'l' => 'lizard'
}
WIN = {
  'rock' => %w(lizard scissors),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'spock' => %w(scissors rock),
  'lizard' => %w(spock paper)
}
WINNING_SCORE = 5

def prompt(message)
  puts "=> #{message}"
end

def print_welcome
  system("clear")
  prompt MESSAGES["welcome1"]
  sleep(1.2)
  prompt MESSAGES["welcome2"]
  sleep(1.8)
  print MESSAGES["welcome3"]
  sleep(0.8)
  print MESSAGES["welcome4"]
  sleep(1)
  print MESSAGES["welcome5"]
  sleep(1.6)
end

def get_player_choice
  choice = ''
  loop do
    choice = gets.chomp
    sleep(0.7)

    if %w(r p sc sp l).include?(choice)
      break
    else
      prompt MESSAGES["invalid_choice"]
    end
  end

  CODE_FOR_MOVE[choice]
end

def tally_scores(player, comp, scores)
  if WIN[player].include?(comp)
    scores[:player] += 1
  elsif WIN[comp].include?(player)
    scores[:comp] += 1
  end

  scores
end

def print_results(player, comp, scores)
  if WIN[player].include?(comp)
    prompt "You won!"
  elsif WIN[comp].include?(player)
    prompt 'Computer won!'
  else
    prompt "It's a tie!"
  end
  sleep(0.4)

  prompt "Player score ~ #{scores[:player]}"
  prompt "Computer score ~ #{scores[:comp]}"
  sleep(0.3)
end

def someone_grand_winner?(scores)
  scores.any? { |(_, score)| score == WINNING_SCORE }
end

def print_grand_winner(scores)
  if scores[:player] == WINNING_SCORE
    prompt MESSAGES["player_g_win"]
  elsif scores[:comp] == WINNING_SCORE
    prompt MESSAGES["comp_g_win"]
  end
  sleep(1.5)
end

def play_again?
  answer = ''
  loop do
    answer = gets.chomp.downcase
    sleep(0.7)

    break if %w(y n).include?(answer)
    prompt MESSAGES['invalid_answer']
  end
  answer == 'y'
end

def reset_game
  prompt "Resetting scoreboard.."
  sleep(0.9)
  prompt "Nil All!"
  sleep(1)
  system("clear")
end

scoreboard = { player: 0, comp: 0 }
print_welcome

loop do
  puts MESSAGES["input_prompt"]
  choice = get_player_choice
  comp_choice = VALID_CHOICES.sample

  prompt "You chose: #{choice}, computer chose #{comp_choice}"
  sleep(1)

  scoreboard = tally_scores(choice, comp_choice, scoreboard)
  print_results(choice, comp_choice, scoreboard)

  next unless someone_grand_winner?(scoreboard)
  print_grand_winner(scoreboard)

  prompt MESSAGES["again?"]
  again = play_again?

  break unless again
  reset_game
  scoreboard = { player: 0, comp: 0 }
end

prompt MESSAGES['goodbye']
