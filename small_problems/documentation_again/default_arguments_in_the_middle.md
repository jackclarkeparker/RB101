The code in this program will result in an output of:
```ruby
[4, 5, 3, 6]
```
This example is found in the Ruby Docs "Calling Methods" page.

In this exercise we are invoking a method and passing in less arguments than
there are parameters so that default values for some of those parameters that
have them must come into effect. When the method was defined, these parameters
were designated a position in the centre of the list of parameters. The ruling
in this situation is as follows:

Arguments from the front of the method call are assigned to each corresponding
parameter that is in front of the set of parameters with default values.

Then, arguments from the back of the method call are assigned to all non-
default value parameters at the back of the list of parameters.

Any left over arguments wedged between those already used will then assign
their values to the remaining parameters from left to right until there are no
more arguments to assign. At this point the default values for the remaining
parameters come into affect.

It is suggested in the API that it is difficult to describe this in words :D