## Lingering Questions
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