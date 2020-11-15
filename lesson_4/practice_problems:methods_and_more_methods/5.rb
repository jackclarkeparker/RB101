=begin

# First Try (Pre Documentation check)

When calling #shift on an array, it removes and returns the first element in
the list.

- I don't know whether #shift works with Hash structures

My assumption is that this will remove and return the first pair in the hash
  - Will this be {a: 'ant'}?
    - Was this the first pair stored in the hash?
      - Yes
      - What if it was the second pair stored in the hash?
        - Then the hash wouldn't be presented with {a: 'ant'} as the first pair

I guess that it will return this pair as a tuple, and that the original `hash`
variable will now only contain it's second pair.

To check can run code, or read documentation

# Post Documentation

Documentation backs me up

# Post Solution

=end