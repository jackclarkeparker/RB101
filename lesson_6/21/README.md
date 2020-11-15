# 21 project from Lesson 6 of RB101 - README

### Description of contents

This directory contains two ruby files; `21.rb` which is my program, and 
`LS_21_solution.rb` which is Launch School's program.  

I've included both files because some of the tasks from the bonus_features assignment for this project were implemented on Launch School's code, and some on my code.   

`21_messages.yml` passes string messages into `21.rb`

The next item in this README file contains some explanations for how and where some of the bonus_features were implemented.   
Below this, there are notes and plans that I made when figuring out how I wanted to implement the project.

##### Twenty-One Bonus Features

1. This bonus feature that assigns player_score and dealer_score variables
   doesn't function very well in my program. Launch School's program executes
   a lot more of it's logic outside of methods compared to mine, which allows
   for variables like player_score and dealer_score to be passed around between
   different parts of the program.
   Because my game uses such a lot of methods, I can't make use of outer scope
   variables in quite the same way.
   If I want to use the player and dealer score variables in my program, I have to pass them into my methods as arguments which make my methods harder to read/cluttered with so many arguments. Additionally, any changes that take place to these variables within my methods will not be reflected on the outside - the values stored in these variables are integers, which cannot be modified as they are immutable.
   I've tried implementing this bonus feature on LS's code instead of mine to try out what is suggested.

2. My main program loop is structured slightly differently from LS's such that
   I only call my `play_again?` method once, so this is commentary of LS's code. 

   The difference between the last invocation and the first two invocations of `play_again?` is that there is no need to pass the method's boolean return value into a ternary conditional statement. This is because there is no longer any distinct code to evaluate under the true condition (that the player does want to play again). This `play_again?` invocation comes at the end of the game loop, so if the player wants to play again, there is no need to call `next` as with the earlier two invocations (which was necessary for skipping extraneous code). The only condition that needs to be given a clause in this case is the false condition of not wanting to play again, which will result in the execution of the `break`, and the exit of the game loop.

3. I'll implement a display_winner method in the LS code again, because my
   code already is written in a way that the result is displayed regardless of how the game comes to an end.

4. I've built the scoring slightly differently to mimic the system used in a
   card game called 500. If you win you gain points and if you lose you lose points. I don't think this system works too well, because sometimes you'll end up playing plenty of rounds but still staying with a fairly level score line as both players rise and fall.

5. I've implemented the BUST_LIMIT and STAY_THRESHOLD constants to allow
   for adaptability of the points limit for the game.

####### WHICH DATA STRUCTURE FOR DECK:
  - 52 cards
    - 4 suits * 13 cards
  - needs to record whether cards are present or not.
  - Sometimes Numeric, Sometimes alphabetic
  - Need to be able to randomly remove values destructively
  Q - Do we need to record the cards that are removed in a separate collection, or is it enough to
      record missing cards from the deck?
  A ~ No need to record.
  Q - Will the cards be shuffled back into the deck after each round, or do we use the deck until there are no cards left, and then shuffle?
  A ~ ?
  Q - Is suit significant?
  A ~ I don't think so.

# An array of arrays, each subarray containing the number of remaining of a given card value.

[[2, 2, 2, 2], [3, 3, 3, 3], [4, 4, 4, 4], [5, 5, 5, 5], [6, 6, 6, 6],
 [7, 7, 7, 7], [8, 8, 8, 8], [9, 9, 9, 9], [10, 10, 10, 10],
 [J, J, J, J], [Q, Q, Q, Q], [K, K, K, K], [A, A, A, A]]


# A 1-dimensional version of the above array.

[ 2, 2, 2, 2,
  3, 3, 3, 3,
  4, 4, 4, 4,
  5, 5, 5, 5,
  6, 6, 6, 6,
  7, 7, 7, 7,
  8, 8, 8, 8,
  9, 9, 9, 9,
  10, 10, 10, 10,
  'J', 'J', 'J', 'J',
  'Q', 'Q', 'Q', 'Q',
  'K', 'K', 'K', 'K',
  'A', 'A', 'A', 'A']


# A hash with keys representing different card values, and corresponding values representing the number of that card remaining.

{
  'A' => 4,
  2 => 4,
  3 => 4,
  4 => 4,
  5 => 4,
  6 => 4,
  7 => 4,
  8 => 4,
  9 => 4,
  10 => 4,
  'J' => 4,
  'Q' => 4,
  'K' => 4
}

You deconstruct this into a "current deck" array by repeatedly passing the
key into the "current deck" value number of times.

You reconstruct the deck count with tally.

Not sure why we even need a deck count in the first place, can just use an array, no?

Do we want to use the deck count at the beginning, just to make it easy to see what our array is?
No, because the process of taking our data from the deck structure and passing it through to the
array is an unnecessary increment of complexity. Displaying the deck initially as an array is no
problem for the programmer.

####### ANSWER FOR DECK DATA STRUCTURE
No reason not to use the 1 dimensional array.
It records what has come out of the deck.
We can randomly remove values from it.
It is simpler than the other two.



####### PLAYER / DEALER CARDS DATA STRUCTURE

  - We'll be summing the values in the data structure to determine whether the hand is bust
  - We'll be adding new values to the data structure.
  - Will need to record values that are stored within.
  - The dealer will need to display the first card that they are dealt.
  - There is no reason that we can't use the same data structure for
    the dealer's hand and the player's hand.
  Q - Will all the values in the data structure be numeric?
      - Number cards will pass their face value into the structure
      - Royal cards will pass 10 into the structure
      - What about aces?
      A ~ Maybe the ace should stay as a string, and when summing the data structure we can determine
          the value of the ace.
  Q - Do we need to record the suit of cards in the hand?
  A ~ I don't think so.

# An array of the values that are contained in a hand:

[2, 5, 'Q', 'A']

Possibly need to generate a new array to perform sum calculations,
retaining the original to display the 'A' for players

K, Q, J may need to be strings as well, because we want to be able to display them,
if they are shown as 10's to the player, this is misleading.

Will need two arrays, one for displaying to the player, another for finding
the sum of actual numeric values - We cannot perform sum on values such as
'Q' and 'A'.

####### ANSWER FOR PLAYER / DEALER DECK DATA STRUCTURE

# An array of the face values that are contained in the hand, that can be
  turned into an array of the real values represented by cards in the hand:

[2, 5, 7, 'A']
[2, 5, 7, 1]

Need two arrays, one for displaying to the player, another for finding
the sum of actual numeric values - We cannot perform sum on values such as
'Q' and 'A'.


####### CALCULATING ACES

Aim:

Determine whether an ace will have a value of 1 or 11, depending on the context.
You should not ask the user what the value of the ace is; your program should be
able to figure this out automatically.

Questions:
  Q - Does it matter how an Ace is represented if hand goes bust either way?
    A ~
  Q - Does the order of the values in the array of real values need to be the
      same as that in display array?
    A ~ No? I guess not, because it will only be used to determine the score of
        a hand, and the order isn't important when finding this (sum of all values
        in array)
  Q - 
  Q - 

Rules
### EXPLICIT:
    - 
    - 
    - 
    - 

### IMPLICIT:
    - Input: Array containing at least one 'A'
    * Player / dealer Hand of cards, with 'J'..'K' already transformed into their numeric values
    - Output: Array
    * Hand with Ace represented by value of 1 or 11, depending on context
    - Find sum of non ace values in hand.
      - Where 11 won't make you go bust, represent ace as 11
      - Otherwise go 1

Examples:

Input:
[2, 3, 'A']
Output:
[2, 3, 11]
# 2 + 3 + 11 <= 21 (not bust) A is represented as 11

Input:
[3, 3, 5, 'A']
Output:
[3, 3, 5, 1]
# 3 + 3 + 5 + 11 > 21 (bust) So A is represented as 1

Input:
[4, 8, 'A', 10]
Output:
[4, 8, 1, 10]
# (And bust)

Data Structure:
  - Array is passed in
  - We'll need to find sum of non ace values first
  - 

Algorithm

Input: Array (hand of cards)

 1. Initialise a variable number_of_aces, setting it equal to the number of aces
    in the input hand.
 2. Initialise ace_value_distribution as an array with `number_of_aces` values,
    each with a value of 11.
 3. Delete all aces from hand
 4. Find the sum of hand
 5. Determine whether the sum of hand + sum of ace_value_distribution is greater than 21
    - If so, replace a value in ace_value_distribution with a value of 1 and try #5 again.
    - If not, or if ace_value_distribution has no more values of 11 left,
      concatenate hand and ace_value_distribution.
 6. Return hand

Output: Array (hand values)

I don't need the duplicate, I'll start using a hand_values duplicate when I change the
royals into their values.

calculate_aces will be a helper method inside of a greater find_hand_score method.

___Lingering Questions___
 1. Should I call #sum in my find_hand_score method? Currently I call this in busted?
    - I guess this branches to: Is busted? a good method to have? I guess it's more
      legible and continuous with the methods I've written which are to do with
      manipulating a deck of cards and finding scores, and sort of written in the
      context of playing a game of cards.
      - I could call sum in the find_hand_score method, and make busted simpler.
        - This is more in keeping with the name of find_hand_score.



## ALGORITHM

 1. Deal Hands
 2. Player Turn
    - Display hands
    - Offer to Hit or Stay
        - If hit, deal a card to player
        - Display hit message
        - Display hands
        - If bust, go to end of game loop
            - Display dealer as winner
            - Offer to play again
          - Loop back to offer of Hit or Stay
      - Display Stay Message
      - Go to Dealer Turn
 3. Dealer Turn
    - Display hands
    - Dealer hand less than 17?
        - Display dealer hits message
        - Deal a card to Dealer
        - Display hands
        - If bust, go to end of game loop
            - Display player as winner
            - Offer to play again
          - Loop back to < 17 check
      - Display Dealer Stay message
      - End of Dealer's turn
 4. Who won?
    - Player bust?
      - If so, the winner is the dealer
    - Dealer bust?
      - If so, the winner is the player
    - Compare hand scores
      - Player higher score?
        - Player winner
      - Dealer higher score?
        - Dealer winner
      - Equal score?
        - No winner
    - Display winner
 5. Play again?


Notes after reading solution:
- LS assigns suits to it's cards. I wonder why they do that?
- They have a big game loop, and orchestrate much of their logic in this loop.
  + One of the things about pushing all fo your code into methods is that it makes it hard to pass values around
  + If the player goes bust, then they display the result of the game using a display_result method, and then use play_again? in a ternary conditional statement that either leads to `next` if true or `break` if false.
    * This break leads to the final 'goodbye' prompt which is outside of the main loop. I was concerned about how I could prevent my game from having multiple exit points, but I didn't need my program to close right there within the method. It's as simple as having a `break if play_again?` statement in the points where the program might need an exit route, these will still all lead to the outside of the loop.
- They used a prompt method, which I didn't use in my game.
- They shuffle their deck once upon initialization, I now see that it's not important to shuffle the deck every time that you deal a card.
  + Maybe I could substitute my deal_card method for a hard-coded pop of my deck? I'm not sure whether this would make it more legible, quite possibly it would.
- LS displays the total that a hand is worth when they display what hand you have, I could include this in my program.
- They indicated how to deliver input by placing the first letter of (h)it and (s)tay in parentheses.
- LS uses symbols when assigning the value of a result variable, and then prints a string corresponding with this symbol in a conditional in a separate method.
  + Finding the result and printing the result are dealt with in two separate methods, featuring very similar looking conditional structures. However, by splitting the work into two different methods, the logic of each is made easier to contend with.
    * I've crammed quite a bit into my `find_result` method, and it returns two significant values which are captured with parallel assignment. Maybe having so much logic coming out the ears of my methods is an indicator that they haven't been planned through a PEDAC process?
