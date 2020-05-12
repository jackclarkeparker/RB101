```ruby
5.step(to: 10, by: 3) { |value| puts value }
5
8
=> 5
```

Numeric#step is a method which takes a sequence of numbers and passes each through a block.

The sequence of numbers is defined by an initial number which is incremented by a step number until it reaches a limit number. The limit number can be included in the sequence.

This method has the option of being called with keyword arguments, which is a new concept for me. Keyword arguments seem to be arguments that are linked to a key, which must be referenced upon invocation, this introduces Keyword arguments, which seem to be arguments that are 