=begin

NOTE:::
In the end I decided to just go with the problem description, I'm not going too
fast right now, so don't want to slow myself down anymore than necessary.

Aim:

Keep score of how many times the player and computer each win. Don't use global
or instance variables. Make it so that the first player to 5 wins the game.

Questions:
  - Shall I make the game win by 2?
  - Shall I store the strings in a yaml file?
    - What if I want to give players the ability to enter their name?
      - This would make it harder to keep the messages stored in a YAML file
        because I couldn't interpolate their names into the messages there.
  A I have lots of messages that involve interpolated values so I don't think
    YAML will work that well. However, I don't want to have these messages
    running amoc through my file, cluttering / poluting it. I'll aim to contain
    them all inside a separate method (/methods?) and call this method in my
    game loop.
  - 
  - 

Rules
### EXPLICIT:
    - Input: Outcome of game
    * 
    - Output: Printed Strings
    *
    - Keep score
    - First player to 5 wins the game
    - 
    - 

### IMPLICIT:
    - Display before each round
    - Display game point
    - Deuce if both players reach 4, win by 2
    - 

### MESSAGES
* "Player score: #{player_score}"\
  "Computer score: #{computer_score}"
* "Deuce!"
* "Advantage #{advantaged_competitor}!"\
  "Match point!"
* "The winner of the grand toe slam is..." (sleep)
  "#{player}!"
* "The winner of the grand toe slam is..." (sleep)
  "The Computer!"

Examples:

### MESSAGES
* "Player score: #{player_score}"\
  "Computer score: #{computer_score}"
* "Deuce!"
* "Advantage #{advantaged_competitor}!"\
  "Match point!"
* "The winner of the grand toe slam is..." (sleep)
  "#{player}!"
* "The winner of the grand toe slam is..." (sleep)
  "The Computer!"

Data Structure:
  - I want to reference score values that are associated with the player/computer
    - hashes are good for associative structures. This for keeping the score.
  - For displaying the messages, a conditional (maybe a case statement?)
  - Two diff message methods;
    - One will be display_score_card (which will also print deuce/match_point messages)
    - The other will be display_grand_winner

(Maybe build deuce after building score card?)

### Start off with score card, first to 5 wins, and print grand winner


Algorithm

Display scorecard whenever the board is displayed

Input: 

Prep:
- (Initialise score_card hash with keys computer and player, each starting with values of 0)

  1. Display player and computer scores
  2. If just one player has a score of 4, print Match point!
  3. If both players have a score of 4, print deuce!
     - Switch to deuce mode, player and computer scores are no longer printed,
       instead display deuce / advantage
  4. 
  5. 

Output: 


=end





=begin

___Lingering Questions___
  1. 
  2. 
  3. 

# POST-SOLUTION

___First thoughts___
  - 
  - 
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


