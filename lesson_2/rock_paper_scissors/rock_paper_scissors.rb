require 'yaml'

MESSAGES = YAML.load_file("rock_paper_scissors_messages.yml")
VALID_CHOICES = %w(rock paper scissors spock lizard)
NUMBER_TO_MOVE = { 1 => 'rock', 2 => 'paper', 3 => 'scissors',
                   4 => 'spock', 5 => 'lizard' }

def prompt(message)
  puts "=> #{message}"
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
  if win?(player, computer)
    scores[0] += 1
  elsif win?(computer, player)
    scores[1] += 1
  end

  scores
end

def display_results(player, computer, scores)
  if win?(player, computer)
    prompt "You won!"
  elsif win?(computer, player)
    prompt 'Computer won!'
  else
    prompt "It's a tie!"
  end
  sleep(0.8)

  prompt "Player score ~ #{scores[0]}"
  prompt "Computer score ~ #{scores[1]}"
end

def win?(first, second)
  (first == 'rock' && ((second == 'lizard') || (second == 'scissors'))) ||
    (first == 'paper' && ((second == 'rock') || (second == 'spock'))) ||
    (first == 'scissors' && ((second == 'paper') || (second == 'lizard'))) ||
    (first == 'spock' && ((second == 'scissors') || (second == 'rock'))) ||
    (first == 'lizard' && ((second == 'spock') || (second == 'paper')))
end

def display_grand_winner(scores)
  if scores[0] == 5
    prompt MESSAGES["player_g_win"]
  elsif scores[1] == 5
    prompt MESSAGES["computer_g_win"]
  end
end

scoreboard = [0, 0]
prompt MESSAGES["welcome"]
sleep(1.2)
loop do
  until scoreboard.any? { |score| score == 5 }
    choice = get_player_choice
    computer_choice = VALID_CHOICES.sample

    prompt "You chose: #{choice}, computer chose #{computer_choice}"
    sleep(1.2)

    scoreboard = tally_scores(choice, computer_choice, scoreboard)
    display_results(choice, computer_choice, scoreboard)
    sleep(0.9)
  end

  display_grand_winner(scoreboard)
  sleep(1.5)

  prompt MESSAGES["again"]
  answer = gets.chomp
  sleep(0.7)
  break unless answer.downcase.start_with?('y')

  scoreboard = [0, 0]
  prompt "Scores have been reset,"
  sleep(0.9)
  prompt "Nil All!"
  sleep(0.7)
end

prompt MESSAGES['goodbye']
