require 'yaml'

MESSAGES = YAML.load_file("rock_paper_scissors_messages.yml")
VALID_CHOICES = %w(rock paper scissors spock lizard)
NUMBER_TO_MOVE = { 1 => 'rock', 2 => 'paper', 3 => 'scissors',
                   4 => 'spock', 5 => 'lizard' }
WIN = { 'rock' => %w(lizard scissors), 'paper' => %w(rock spock),
        'scissors' => %w(paper lizard), 'spock' => %w(scissors rock),
        'lizard' => %w(spock paper) }

def prompt(message)
  puts "=> #{message}"
end

def welcome
  system("clear")
  prompt MESSAGES["welcome"]
  sleep(1.2)
end

def get_player_choice
  choice = ''
  loop do
    puts MESSAGES["input_prompt"]

    choice = gets.chomp
    sleep(0.7)
    if ('1'..'5').include?(choice)
      break
    else
      prompt MESSAGES["invalid_number"]
    end
  end

  NUMBER_TO_MOVE[choice.to_i]
end

def tally_scores(player, computer, scores)
  if WIN[player].include?(computer)
    scores[0] += 1
  elsif WIN[computer].include?(player)
    scores[1] += 1
  end

  scores
end

def print_results(player, computer, scores)
  if WIN[player].include?(computer)
    prompt "You won!"
  elsif WIN[computer].include?(player)
    prompt 'Computer won!'
  else
    prompt "It's a tie!"
  end
  sleep(0.4)

  prompt "Player score ~ #{scores[0]}"
  prompt "Computer score ~ #{scores[1]}"
  sleep(0.3)
end

def someone_grand_winner?(scores)
  scores.any? { |score| score == 5 }
end

def print_grand_winner(scores)
  if scores[0] == 5
    prompt MESSAGES["player_g_win"]
  elsif scores[1] == 5
    prompt MESSAGES["computer_g_win"]
  end
  sleep(1.5)
end

def play_again?
  loop do
    answer = gets.chomp
    sleep(0.7)

    if answer == 'y'
      break true
    elsif answer == 'n'
      break false
    else
      prompt MESSAGES['invalid_answer']
    end
  end
end

def reset_game
  prompt "Resetting scoreboard.."
  sleep(0.9)
  prompt "Nil All!"
  sleep(1)
  system("clear")
end

scoreboard = [0, 0]
welcome

loop do
  choice = get_player_choice
  computer_choice = VALID_CHOICES.sample

  prompt "You chose: #{choice}, computer chose #{computer_choice}"
  sleep(1)

  scoreboard = tally_scores(choice, computer_choice, scoreboard)
  print_results(choice, computer_choice, scoreboard)

  next unless someone_grand_winner?(scoreboard)
  print_grand_winner(scoreboard)

  prompt MESSAGES["again?"]
  again = play_again?
  break unless again

  reset_game
  scoreboard = [0, 0]
end

prompt MESSAGES['goodbye']
